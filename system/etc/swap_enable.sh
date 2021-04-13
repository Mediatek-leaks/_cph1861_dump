#!/system/bin/sh
#
#ifdef VENDOR_EDIT
#huacai.zhou@PSW.BSP.kernel.drv, 2018/03/09, adjust zram size according to total ram size
MemTotalStr=`cat /proc/meminfo | grep MemTotal`
MemTotal=${MemTotalStr:16:8}

if [ $MemTotal -lt 2097152 ]; then
  #config 1GB zram size with memory less than 2 GB
  echo 1073741824 > /sys/block/zram0/disksize
elif [ $MemTotal -lt 3145728 ]; then
  #config 1.6GB zram size with memory less than 3 GB
  echo 1717986918 > /sys/block/zram0/disksize
elif [ $MemTotal -lt 4194304 ]; then
  #config 2GB zram size with memory less than 4 GB
  echo 2147483648 > /sys/block/zram0/disksize
else
  #config 1GB zram size with memory greater than 4 GB
  echo 1073741824 > /sys/block/zram0/disksize
fi

mkswap /dev/block/zram0
swapon /dev/block/zram0
#endif /* VENDOR_EDIT */
