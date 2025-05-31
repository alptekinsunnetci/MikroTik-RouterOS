# MikroTik FTP Backup Script Configuration

This script is used to automatically back up your MikroTik router configuration and upload it to a remote FTP server.  
Before using the script, you **must** update the following variables with your own FTP server details:

```mikrotik
:local ftpserver "10.10.1.2"
:local username "MikrotikBackupUser"
:local password "clear_text_password"
:local port 21
:local remotePath "mikrotik-router"
```

## Variable Descriptions

- **ftpserver**  
  The IP address or hostname of your FTP server.  
  Example: `"192.168.1.100"` or `"ftp.example.com"`

- **username**  
  The username for authentication on the FTP server.

- **password**  
  The password for the specified FTP user.  
  > **Warning:** The password is stored in plain text. Make sure to protect your script.

- **port**  
  The port number used by the FTP server. Default is `21`.

- **remotePath**  
  The directory on the FTP server where the backup files will be uploaded.  
  Example: `"mikrotik-backups"`

## How to Update

Replace the values inside the quotes (`" "`) with your own FTP server information.  
**Example:**
```mikrotik
:local ftpserver "192.168.88.10"
:local username "myFtpUser"
:local password "MySecurePassword"
:local port 2121
:local remotePath "router_backups"
```

---

After editing, copy the entire script (including your changes) to your MikroTik router.

---
