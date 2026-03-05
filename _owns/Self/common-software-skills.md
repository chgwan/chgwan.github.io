# Common HPC user solutions

## Codex
1. ssh -D SOCKS path works for simple curl requests.
2. The same path fails consistently for codex exec with:
    stream disconnected before completion ... /backend-api/codex/responses.
3. Codex debug logs show it is using the SOCKS proxy, but stream requests still disconnect.
4. Switching to HTTP CONNECT proxy on the same host/network makes codex exec "hello" succeed (RC=0, output hello).

Likely reason:

- Codex uses long-lived bidirectional streaming (WebSocket + HTTPS fallback stream), and this specific OpenSSH dynamic SOCKS (ssh -D) path is unstable for
that traffic pattern here.
- It’s not your login/auth issue, because the exact same Codex command works once proxy type is changed to CONNECT.

So the practical fix is CONNECT proxy, not SOCKS, for Codex traffic.