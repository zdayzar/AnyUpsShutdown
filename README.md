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


## 🛠 **Auto-Start on Boot (Optional)**  

To run this script automatically at startup, follow these steps:  

### 1️⃣ **Move the Script to `/usr/local/bin/`**  
```bash
sudo mv check_connection.sh /usr/local/bin/check_internet.sh
sudo chmod +x /usr/local/bin/check_internet.sh
```

### 2️⃣ **Add to Crontab**  
Edit the root crontab to run the script at boot:  
```bash
sudo crontab -e
```

Add this line at the bottom to ensure it starts on every reboot:  
```bash
@reboot /usr/local/bin/check_internet.sh &
```

### 3️⃣ **Restart to Test (Optional)**  
You can reboot your system to verify the script starts automatically:  
```bash
sudo reboot
```

### 4️⃣ **Check if the Script is Running**  
After rebooting, verify if the script is running:  
```bash
ps aux | grep check_internet.sh
```

---

✅ **Now the script will automatically monitor the connection every time the system boots up!** 🚀 Let me know if you’d like to add anything else! 🌟  

## 📄 License
MIT License. Contributions welcome! 🌟
