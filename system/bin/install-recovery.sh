#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:42583664:d48fd3ab19206d2d301efc889218583169359e8a; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/bootdevice/by-name/boot:11304560:ec38cf9cd2e5e8b0e47d3e5f0b0e950d1ae5e43c EMMC:/dev/block/platform/bootdevice/by-name/recovery d48fd3ab19206d2d301efc889218583169359e8a 42583664 ec38cf9cd2e5e8b0e47d3e5f0b0e950d1ae5e43c:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
