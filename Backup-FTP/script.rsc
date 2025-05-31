# ---------------------------------
#        Alptekin Sunnetci
# ---------------------------------



# ---------------------------------
# Function: Change Date/Time format
# ---------------------------------
:global date2ymd do={
    # Input: "2025-05-31 07:04:54"
    :local dtime [:tostr $1]
    :local yyyy [:pick $dtime 0 4]
    :local MM   [:pick $dtime 5 7]
    :local dd   [:pick $dtime 8 10]
    :local hh   [:pick $dtime 11 13]
    :local mm   [:pick $dtime 14 16]
    :local ss   [:pick $dtime 17 19]
    :return ($yyyy . $MM . $dd . "-" . $hh . $mm . $ss)
}

# ------------
# Main script
# ------------
:global date2ymd
:local sysname [/system identity get name]
:local mydatetime ("$[/system clock get date] $[/system clock get time]")
:local textfilename
:local backupfilename

# FTP configuration
:local ftpserver "10.10.1.2"
:local username "MikrotikBackupUser"
:local password "clear_text_password"
:local port 21

# Remote directory on the FTP server where files will be uploaded
:local remotePath "mikrotik-router"

# Clean up the system name by replacing spaces and special characters
:local cleanname do={
    :local in [:tostr $1]
    :local out ""
    :for i from=0 to=([:len $in]-1) do={
        :local ch [:pick $in $i ($i+1)]
        :if ([:find "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_" $ch] != nil) do={
            :set out ($out . $ch)
        } else={
            :set out ($out . "_")
        }
    }
    :return $out
}
:set sysname [$cleanname $sysname]

:set mydatetime [$date2ymd $mydatetime]
:set textfilename ($mydatetime . "-" . $sysname . ".rsc")
:set backupfilename ($mydatetime . "-" . $sysname . ".backup")

:log info ">>> START FTP Backup <<<"

# Export and backup operations
/export file=$textfilename show-sensitive
:delay 5s
/system backup save name=$backupfilename
:delay 5s

:log info ">>> Backup OK <<<"

# Prepare remote file paths for upload
:local remotefile1 ($remotePath . "/" . $textfilename)
:local remotefile2 ($remotePath . "/" . $backupfilename)

# Send files to FTP server (mode=ftp and port parameter added)
/tool fetch address=$ftpserver user=$username password=$password \
    src-path=$textfilename dst-path=$remotefile1 upload=yes mode=ftp port=$port
:delay 5s
/tool fetch address=$ftpserver user=$username password=$password \
    src-path=$backupfilename dst-path=$remotefile2 upload=yes mode=ftp port=$port

:log info ">>> Files sent to FTP <<<"

# Delete local files
:delay 5s
/file remove $textfilename
/file remove $backupfilename

:log info ">>> END FTP Backup <<<"
