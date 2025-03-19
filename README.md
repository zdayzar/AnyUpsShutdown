# 🚀 AnyUpsShutdown

A Bash script to monitor router/IP connectivity and automatically shut down the system after repeated failures — perfect for UPS-powered setups to prevent battery drain.

## 📦 Features
- Monitors connection to a target IP.
- Automatic shutdown after a set number of failures.
- Dry-run mode for safe testing.
- Logs status and failures.

## ⚙️ Configuration
Edit these variables in the script:
- `ROUTER_IP` – IP to ping (default: 192.168.0.1)
- `TIMEOUT` – Ping timeout in seconds (default: 5)
- `LIMITGAGAL` – Max consecutive failures before shutdown (default: 30)
- `SLEEP_INTERVAL` – Time between checks (default: 10)
- `LOG_FILE` – Log file path (default: /var/log/check_connection.log)

## 📥 Installation
1. Clone the repository:
```bash
git clone https://github.com/zdayzar/AnyUpsShutdown.git
cd AnyUpsShutdown
```
2. Make the script executable:
```bash
chmod +x check_connection.sh
```

## ▶️ Usage
Run in normal mode (shuts down after failures):
```bash
sudo ./check_connection.sh
```
Test with dry-run mode (no shutdown):
```bash
sudo ./check_connection.sh --dry-run
```

## 📋 Logs
Logs are saved in the file specified by `LOG_FILE`:
```bash
tail -f /var/log/check_connection.log
```

## 📝 Notes
- Requires `sudo` for shutdown.
- Adjust the shutdown command if needed.

## 📄 License
MIT License. Contributions welcome! 🌟
