#!/bin/bash

# Copy this file to /usr/local/bin/rcode.sh then symlink it to /usr/local/bin/rcode. Make sure to chmod +x it (chmod +x /usr/local/bin/rcode.sh)

PROJPATH="$(pwd)"

# RCOMMAND is the command to run on the remote machine to open the project in vscode / codium

RCOMMAND="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
#RCOMMAND="codium"


# RHOST is the machine the user is ssh'd in from. If this doesn't work automatically, you can set it manually

RHOST=$(echo $SSH_CLIENT | awk '{print $1}')
#RHOST="my-computer"

if [[ ${#1} -gt 0 ]]; then
	PROJPATH=$(realpath "$1")
fi

if [[ ! -d "$PROJPATH" ]]; then
	echo "Error: can not find project path \"$PROJPATH\""
	exit 1
fi

PROJPATH=$(printf %q "$PROJPATH")
RCOMMAND=$(printf %q "$RCOMMAND")
HNAME=$(hostname)

echo "ssh $RHOST \"$RCOMMAND --folder-uri vscode-remote://ssh-remote+$HNAME$PROJPATH\""
if [[ -z ${JUSTPRINT+x} ]]; then
	ssh $RHOST "$RCOMMAND --folder-uri vscode-remote://ssh-remote+$HNAME$PROJPATH"
fi
