#!/bin/bash
# 01 Eylul 2015 http://www.caylakpenguen.tk
# Vps sunucuya ihtiyac geregi swapfile olusturmak icin betik.
#
echo " Swapfile.img hazirlaniyor"
dd if=/dev/zero of=/swapfile.img bs=1M count=1024 >/dev/null 2>/dev/null
echo " -----> modu degistiriliyor"
chmod 0600 /swapfile.img >/dev/null 2>/dev/null
echo " -----> Swapfile.img swap haline donusturuluyor"
mkswap /swapfile.img  >/dev/null 2>/dev/null
echo " -----> Swapfile.img Kullanima aliniyor"
swapon /swapfile.img >/dev/null 2>/dev/null
echo " -----> /etc/fstab Swapfile girdisi ekleniyor"
echo "/swapfile.img   none    swap    sw    0   0" >>/etc/fstab
echo " -----> islem tamamlandi..."
echo " -----> Sonuc"

free
