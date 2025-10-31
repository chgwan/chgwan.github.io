# shellcheck shell=sh
VSCODE_TMP_FOLDER="/tmp/vscode-server-download"

echo "9d0ba5fd52e6: running"
echo "Script executing under PID: $$"

# Configuration
UUID="9d0ba5fd52e6"
COMMIT_ID="" # find in vscode client.
QUALITY="stable"
PLATFORM_DOWNLOAD_PATH="" # find in ssh server
SERVER_TARGET=""

# local download
DID_LOCAL_DOWNLOAD=0
CURREN_DIR=$(pwd)

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
    # Get platform info directly from remote system
    PLATFORM_DOWNLOAD_PATH=$(cat $CURREN_DIR/get_server_config.sh | ssh -T "$SERVER_TARGET" sh )
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
	DOWNLOAD_URL2=https://update.code.visualstudio.com/commit:$COMMIT_ID/server-linux-x64/${QUALITY}
	TARGET="${VSCODE_TMP_FOLDER}/vscode-cli-${COMMIT_ID}.tar.gz"
	FLAG="${VSCODE_TMP_FOLDER}/vscode-cli-${COMMIT_ID}.tar.gz.done"

	mkdir -p "${VSCODE_TMP_FOLDER}"

	echo "Downloading from: ${DOWNLOAD_URL}"
	# Try wget first, then curl as a fallback
	if command -v wget >/dev/null 2>&1; then
		if wget -c -q --show-progress --progress=dot:giga --tries=3 --timeout=30 \
			-O "${TARGET}" "${DOWNLOAD_URL}"; 
		then 
			wget -c -q --show-progress --progress=dot:giga --tries=3 --timeout=30 \
						-O "${TARGET}.server" "${DOWNLOAD_URL2}"; 
			mv ${TARGET} ${FLAG}
		else
			echo "wget failed to download ${DOWNLOAD_URL}"
			fail_with_exitcode 198
		fi
	elif command -v curl >/dev/null 2>&1; then
		if curl -fL --retry 3 --connect-timeout 30 -C - \
		-o "${TARGET}" "${DOWNLOAD_URL}"; 
		then 
			curl -fL --retry 3 --connect-timeout 30 -C - \
			-o "${TARGET}.server" "${DOWNLOAD_URL2}";
			mv ${TARGET} ${FLAG}
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

# Execute installation commands on remote server
do_remote_install() {
	if ssh "$SERVER_TARGET" "
		cd ${VSCODE_AGENT_FOLDER}
		cd ~/.vscode-server
		tar -xzf vscode-cli-${COMMIT_ID}.tar.gz --no-same-owner # add +v
		mv code code-${COMMIT_ID}
		mkdir -p cli/servers/Stable-${COMMIT_ID}
		tar -xzf vscode-cli-${COMMIT_ID}.tar.gz.server 
		mv vscode-server-linux-x64 cli/servers/Stable-${COMMIT_ID}/server
	"
	then echo "success installed ...";
	else echo 
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