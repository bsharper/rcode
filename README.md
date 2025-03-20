# rcode
Simple script to open VS Code or similar editor running on a remote host

## What It Does

`rcode` works like the `code` command but for remote development. When you run it on a remote server, it triggers your local VS Code instance to connect to that remote server and open the current/specified directory.

## Requirements

- SSH connection between your local and remote machines
- VS Code installed on your local machine
- SSH extension for VS Code on your local machine
- Currently this is expecting a macOS environment, but this should work anywhere `code` works.
- Not required, but having the remote host in your `.ssh/config` file by hostname can make things smoother.

## Installation

1. Copy the script to your remote server:
   ```bash
   sudo cp rcode.sh /usr/local/bin/rcode.sh
   sudo ln -s /usr/local/bin/rcode.sh /usr/local/bin/rcode
   sudo chmod +x /usr/local/bin/rcode.sh
   ```
2. Customize if needed (edit `/usr/local/bin/rcode.sh`):
Change `RCOMMAND` if you use VSCodium or a different VS Code path
Set `RHOST` manually if automatic detection doesn't work

## Examples

```bash
# Open current directory in VS Code
rcode

# Open specific directory in VS Code
rcode /path/to/project

# Open a project relative to current directory
rcode ./my-project

# Open parent directory
rcode ..
```