# Install vscode offline 3 methods

Newer VS Code Remote-SSH loads the server directly from
`~/.vscode-server/bin/<COMMIT_ID>/` (files extracted straight in, no `server/`
subfolder). The old `cli/servers/Stable-<COMMIT_ID>/server` layout is deprecated;
any such dirs still on disk are kept only for backward compatibility.

1. Copy local `.vscode-server/bin/COMMIT_ID` to the remote `.vscode-server/bin/COMMIT_ID`
2. Copy an existing remote `.vscode-server/bin/COMMIT_ID` between machines
3. run `bash vscode_local2server.sh --help`