# shellcheck shell=sh
VSCODE_TMP_FOLDER="/tmp/vscode-server-download"

echo "9d0ba5fd52e6: running"
echo "Script executing under PID: $$"

# Configuration
UUID="9d0ba5fd52e6"
COMMIT_ID="" # find in vscode client.
QUALITY="stable"
SERVER_TARGET=""
PLATFORM_DOWNLOAD_PATH="" # auto-detected from remote by get_remote_platform()
SERVER_DOWNLOAD_PATH="" # auto-detected from remote by get_remote_platform()

KEEP_LOCAL=0

usage() {
	echo "Usage: $0 [-c COMMIT_ID] [-s SERVER_TARGET] [-q QUALITY] [-k] [COMMIT_ID] [SERVER_TARGET]"
	echo "  -c COMMIT_ID     vscode commit id (find in vscode client)"
	echo "  -s SERVER_TARGET ssh target, e.g. user@host"
	echo "  -q QUALITY       release quality (default: stable)"
	echo "  -k               keep local download cache (reuse for other servers)"
	echo "  -h               show this help"
	echo
	echo "Reuse the same download across servers, e.g.:"
	echo "  $0 -k -c COMMIT_ID -s user@host1   # downloads, keeps cache"
	echo "  $0 -k -c COMMIT_ID -s user@host2   # reuses cache, no re-download"
}

# Parse command line arguments (flags override the defaults above)
while getopts "c:s:q:kh" opt; do
	case "$opt" in
		c) COMMIT_ID="$OPTARG" ;;
		s) SERVER_TARGET="$OPTARG" ;;
		q) QUALITY="$OPTARG" ;;
		k) KEEP_LOCAL=1 ;;
		h) usage; exit 0 ;;
		*) usage; exit 1 ;;
	esac
done
shift $((OPTIND - 1))

# Positional fallbacks: first = COMMIT_ID, second = SERVER_TARGET
if [ -n "$1" ]; then
	COMMIT_ID="$1"
fi
if [ -n "$2" ]; then
	SERVER_TARGET="$2"
fi

# The install dir uses a capitalized quality (Stable / Insider), while the
# download URL uses the lowercase form (stable / insider).
QUALITY_CAP=$(printf '%s' "$QUALITY" | cut -c1 | tr '[:lower:]' '[:upper:]')$(printf '%s' "$QUALITY" | cut -c2-)

# local download
DID_LOCAL_DOWNLOAD=0

fail_with_exitcode() {
	echo "${UUID}: start"
	echo "exitCode==$1=="
	echo_common_results
	echo "${UUID}: end"
	exit 0
}
echo_common_results() {
	echo "platformDownloadPath==$PLATFORM_DOWNLOAD_PATH=="
	echo "quality==${QUALITY}=="
	echo "commitID==${COMMIT_ID}=="
	echo "UUID==${UUID}=="
	echo "SERVER_TARGET==${SERVER_TARGET}=="
}

if [ -z "$COMMIT_ID" ]; then
	echo "${UUID}: COMMIT_ID is empty"
	fail_with_exitcode 1
fi

if [ -z "$SERVER_TARGET" ]; then
	echo "${UUID}: SERVER_TARGET is empty"
	fail_with_exitcode 1
fi

get_remote_platform() {
    # Get platform info directly from remote system.
    # The detection logic below is executed ON THE REMOTE host via ssh, so the
    # heredoc delimiter is quoted ('REMOTE_EOF') to keep $HOME/$(uname ...)/etc.
    # from being expanded by the local shell.
    #
    # The remote emits exactly two lines on stdout (CLI path, then server path);
    # all diagnostics go to stderr so they are not captured into the variables.
    _remote_out=$(ssh -T "$SERVER_TARGET" sh <<'REMOTE_EOF'
VSCODE_AGENT_FOLDER="$HOME/.vscode-server"
OSRELEASEID=$(cat /etc/os-release 2>/dev/null | grep -a -E '^ID=' | sed 's/^[Ii][Dd]=//g' | sed 's/"//g')
if [ -z "$OSRELEASEID" ]
then
	OSRELEASEID=$(cat /usr/lib/os-release 2>/dev/null | grep -a -E '^ID=' | sed 's/^[Ii][Dd]=//g' | sed 's/"//g')
	if [ -z "$OSRELEASEID" ]
	then
		OSRELEASEID=$(uname -s)
	fi
fi

#
# Get host platform/architecture
#
UNAME=$(uname -s)
case $UNAME in
	Linux) PLATFORM=linux;;
	Darwin) PLATFORM=macOS;;
	*)
		echo "Unsupported platform: $UNAME" >&2
		exit 203
		;;
esac

BITNESS=$(getconf LONG_BIT)
ARCH=$(uname -m)
case $ARCH in
	x86_64) VSCODE_ARCH="x64";;
	armv7l | armv8l)
		VSCODE_ARCH="armhf"
		;;
	arm64 | aarch64)
		if [ "$BITNESS" = 32 ]; then
			# Can have 32-bit userland on 64-bit kernel
			VSCODE_ARCH="armhf"
		else
			VSCODE_ARCH="arm64"
		fi
		;;
	*)
		OSRELEASE=$(uname -r)
		case $OSRELEASE in
			*x86_64*) VSCODE_ARCH="x64";;
			*)
				echo "Unsupported architecture: $ARCH" >&2
				exit 196
			;;
		esac
		;;
esac

if [ "$PLATFORM" = linux ]; then
	if [ "$VSCODE_ARCH" = armhf ]; then
		PLATFORM_DOWNLOAD_PATH=cli-linux-armhf
	else
		PLATFORM_DOWNLOAD_PATH=cli-alpine-$VSCODE_ARCH
	fi
	# Server build matches the detected linux architecture
	SERVER_DOWNLOAD_PATH=server-linux-$VSCODE_ARCH
elif [ "$VSCODE_ARCH" = "arm64" ]; then
	PLATFORM_DOWNLOAD_PATH=cli-darwin-arm64
	SERVER_DOWNLOAD_PATH=server-darwin-arm64
else
	PLATFORM_DOWNLOAD_PATH=cli-darwin-x64
	SERVER_DOWNLOAD_PATH=server-darwin
fi

if [ ! -d "$VSCODE_AGENT_FOLDER" ]; then
	mkdir -p "$VSCODE_AGENT_FOLDER"
	chmod 750 "$VSCODE_AGENT_FOLDER"

	error_code=$?
	if [ "${error_code}" -gt 0 ]; then
		echo "Creating the server install dir failed..." >&2
		exit 202
	fi
fi

echo "$PLATFORM_DOWNLOAD_PATH"
echo "$SERVER_DOWNLOAD_PATH"
REMOTE_EOF
)

    # Parse the two emitted lines and validate them.
    PLATFORM_DOWNLOAD_PATH=$(printf '%s\n' "$_remote_out" | sed -n '1p')
    SERVER_DOWNLOAD_PATH=$(printf '%s\n' "$_remote_out" | sed -n '2p')

    if [ -z "$PLATFORM_DOWNLOAD_PATH" ] || [ -z "$SERVER_DOWNLOAD_PATH" ]; then
        echo "${UUID}: failed to detect remote platform (ssh to '$SERVER_TARGET')"
        fail_with_exitcode 197
    fi
}
do_client_download() {
	echo "I am in $HOSTNAME"
	DID_LOCAL_DOWNLOAD=1
	echo "Trigger local server download"
	echo artifact==$PLATFORM_DOWNLOAD_PATH==
	echo destFolder==$VSCODE_TMP_FOLDER==
	echo destFolder2==/vscode-cli-$COMMIT_ID.tar.gz==
	echo "${GET_DOWNLOAD_SERVER_END_TRIGGER}"
	echo "Waiting for client to transfer server archive..."
	echo "Waiting for $VSCODE_TMP_FOLDER/vscode-cli-$COMMIT_ID.tar.gz.done and vscode-server.tar.gz to exist"
	DOWNLOAD_URL=https://update.code.visualstudio.com/commit:$COMMIT_ID/$PLATFORM_DOWNLOAD_PATH/${QUALITY}
	DOWNLOAD_URL2=https://update.code.visualstudio.com/commit:$COMMIT_ID/$SERVER_DOWNLOAD_PATH/${QUALITY}
	TARGET="${VSCODE_TMP_FOLDER}/vscode-cli-${COMMIT_ID}.tar.gz"
	FLAG="${VSCODE_TMP_FOLDER}/vscode-cli-${COMMIT_ID}.tar.gz.done"

	mkdir -p "${VSCODE_TMP_FOLDER}"

	# Reuse a previously downloaded cache (e.g. when pushing to another server)
	if [ -f "$FLAG" ] && [ -f "${TARGET}.server" ]; then
		echo "Cached archives found for commit ${COMMIT_ID}, skipping download"
		return 0
	fi

	echo "Downloading from: ${DOWNLOAD_URL}"
	# Try wget first, then curl as a fallback
	if command -v wget >/dev/null 2>&1; then
		if wget -c -q --show-progress --progress=dot:giga --tries=3 --timeout=30 \
			-O "${TARGET}" "${DOWNLOAD_URL}";
		then
			if wget -c -q --show-progress --progress=dot:giga --tries=3 --timeout=30 \
						-O "${TARGET}.server" "${DOWNLOAD_URL2}";
			then
				mv "${TARGET}" "${FLAG}"
			else
				echo "wget failed to download ${DOWNLOAD_URL2}"
				fail_with_exitcode 198
			fi
		else
			echo "wget failed to download ${DOWNLOAD_URL}"
			fail_with_exitcode 198
		fi
	elif command -v curl >/dev/null 2>&1; then
		if curl -fL --retry 3 --connect-timeout 30 -C - \
		-o "${TARGET}" "${DOWNLOAD_URL}";
		then
			if curl -fL --retry 3 --connect-timeout 30 -C - \
			-o "${TARGET}.server" "${DOWNLOAD_URL2}";
			then
				mv "${TARGET}" "${FLAG}"
			else
				echo "curl failed to download ${DOWNLOAD_URL2}"
				fail_with_exitcode 198
			fi
		else
			echo "curl failed to download ${DOWNLOAD_URL}"
			fail_with_exitcode 198
		fi
	else
		echo "Neither wget nor curl is available"
		fail_with_exitcode 198
	fi
}

transfer_2_remote() {
	if [ -f "$FLAG" ]; then
		rsync -avzP "$FLAG" $SERVER_TARGET:.vscode-server/vscode-cli-${COMMIT_ID}.tar.gz
		rsync -avzP "${TARGET}.server" $SERVER_TARGET:.vscode-server/vscode-cli-${COMMIT_ID}.tar.gz.server
		echo "Data transferred successfully"
	else
		echo "Fail to transfer data"
		fail_with_exitcode 199
	fi
}

do_cleanup() {
	if [ "$KEEP_LOCAL" -eq 1 ]; then
		echo "Keeping local download cache at ${VSCODE_TMP_FOLDER} (-k)"
		echo "  $FLAG"
		echo "  ${TARGET}.server"
		return 0
	fi
	echo "Cleaning up local download cache..."
	rm -f "$FLAG" "${TARGET}.server"
	echo "Cleanup done"
}

# Execute installation commands on remote server
do_remote_install() {
	if ssh "$SERVER_TARGET" "
		cd ~/.vscode-server
		tar -xzf vscode-cli-${COMMIT_ID}.tar.gz --no-same-owner # add +v
		mv code code-${COMMIT_ID}
		mkdir -p cli/servers/${QUALITY_CAP}-${COMMIT_ID}
		tar -xzf vscode-cli-${COMMIT_ID}.tar.gz.server
		mv vscode-${SERVER_DOWNLOAD_PATH} cli/servers/${QUALITY_CAP}-${COMMIT_ID}/server
	"
	then echo "success installed ...";
	else
		echo "${UUID}: remote install failed on '$SERVER_TARGET'"
		fail_with_exitcode 200
	fi
}
echo_common_results
get_remote_platform
echo_common_results
do_client_download
transfer_2_remote
# # After download, run installation
if [ $DID_LOCAL_DOWNLOAD -eq 1 ]; then
	do_remote_install
fi
do_cleanup