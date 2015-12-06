#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9478144 a0fa26e1bbbeb30984a9d38adef3a929cf5bc64a 6727680 bf6641176a9a2a3e0f5bb102dc0f385b721b4d19
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:9478144:a0fa26e1bbbeb30984a9d38adef3a929cf5bc64a; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6727680:bf6641176a9a2a3e0f5bb102dc0f385b721b4d19 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery a0fa26e1bbbeb30984a9d38adef3a929cf5bc64a 9478144 bf6641176a9a2a3e0f5bb102dc0f385b721b4d19:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
