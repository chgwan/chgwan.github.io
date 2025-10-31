#!/bin/bash
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
		echo "Unsupported platform: $UNAME"
		fail_with_exitcode 203
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
				echo "Unsupported architecture: $ARCH"
				fail_with_exitcode 196
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
elif [ "$VSCODE_ARCH" = "arm64" ]; then
	PLATFORM_DOWNLOAD_PATH=cli-darwin-arm64
else
	PLATFORM_DOWNLOAD_PATH=cli-darwin-x64
fi

if [ ! -d "$VSCODE_AGENT_FOLDER" ]; then
	mkdir -p "$VSCODE_AGENT_FOLDER"
	chmod 750 "$VSCODE_AGENT_FOLDER"

	error_code=$?
	if [ "${error_code}" -gt 0 ]; then
		echo "Creating the server install dir failed..."
		fail_with_exitcode 202
	fi
fi

# Add this at the end of the file
get_platform_info() {
    echo "$PLATFORM_DOWNLOAD_PATH"
}
get_platform_info