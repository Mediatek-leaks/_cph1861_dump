#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:30483280:e17f36243905ebb9e8dcf22176cd4c6231bd9491; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:9780048:3a9b9f78e784f5bc95149da759b6d02432f43f42 EMMC:/dev/block/platform/bootdevice/by-name/recovery e17f36243905ebb9e8dcf22176cd4c6231bd9491 30483280 3a9b9f78e784f5bc95149da759b6d02432f43f42:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
