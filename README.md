# anyupsshutdown
AnyUpsShutdown is a Bash script that monitors a router/IP connection. After a set number of failures, it automatically shuts down the system to prevent UPS battery drain. Configurable timeout, retry limit, and sleep interval. Supports dry-run mode for testing without shutdown. Logs connection status. Requires sudo.

Alright! Let’s add a dry-run mode so you can test the script without actually shutting down the system. I’ll add a flag like --dry-run that you can pass when running the script. Here’s the updated version:
sudo ./check_connection.sh --dry-run

In dry-run mode:
No shutdown will happen.
It will log everything and print a message when the shutdown would have occurred.
When you’re ready to run it for real, just remove the --dry-run:
sudo ./check_connection.sh
