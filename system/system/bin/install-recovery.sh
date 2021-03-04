#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:30491472:a5dd702c8e796986712f865384c8a9856e105cbd; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:9786192:2a54672f2314fa56c5e4965bc243005d99c0ee39 EMMC:/dev/block/platform/bootdevice/by-name/recovery a5dd702c8e796986712f865384c8a9856e105cbd 30491472 2a54672f2314fa56c5e4965bc243005d99c0ee39:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
