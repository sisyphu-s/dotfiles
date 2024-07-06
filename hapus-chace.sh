#!/usr/bin/bash

[ "$UID" -eq 0 ] || exec sudo "$0" "$@"
#cek cache dari aplikasi
du -sh /var/cache/apt/archives


#Bersihkan semua yang ada di file log
logs=`find /var/log -type f`
for i in $logs
do
     > $i
done
 
echo "memberhasilkan chace...."
apt-get clean && apt-get autoclean
apt-get autoremove -y

#check aplikasi deborphan ada tidak?
if deborphan -h &> /dev/null;
then
	deborphan | xargs sudo apt-get -y remove --purge
	# Hapus semua log yang sudah lama dan sudah di archive
	find /var/log -type f -regex ".*\.gz$" | xargs rm -Rf
	find /var/log -type f -regex ".*\.[0-9]$" | xargs rm -Rf
else
	apt install -y deborphan
fi

# Bersihkan semua file yang ada di tong sampah
rm -rf /home/*/.local/share/Trash/*/**
rm -rf /root/.local/share/Trash/*/*

 
echo 
echo "Proses bersih-bersih sudah selesai!"


# Jika dijalankan oleh pengguna reguler
pathSS="/home/starlord/Pictures/Screenshots/screenshot.sh"
pathVoko="/home/starlord/Videos/voko/screenrecord.sh"

if [ -e $pathSS ]; then
  $pathSS
else
  echo "tidak ada file:$pathSS"
fi

if [ -e $pathVoko ]; then
  $pathVoko
else
  echo "tidak ada file:$pathVoko"
fi
