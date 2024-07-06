#!/usr/bin/bash
#
home="$HOME"

function tmux_menu(){
  local nomor=1 lastMenu=6 localFunc="tmux_menu"

  function menu(){
	if [ "$1" == "tmux_menu" ]; then
	  echo "__ tmux program __"
	  echo "1. check last symlink"
	  echo "2. mengubah filename symlink"
	  echo "3. mengubah last link symlink ke custom resurrect session"
	  echo "4. check custom resurrect session"
	  echo "5. hapus tmux_resurrect_year"
	  echo "$lastMenu. exit"
	  read -p "pilih menu [1 - $lastMenu] : " nomor
	fi
  }

  while [ $nomor != $lastMenu ]; do
	menu $localFunc
	clear
	case $nomor in
		1) 
		  checkLastSymlink;;
		2)
		  renameFileLastSymlink;;
		3)
		  changeLastSymlink;;
		4)
		  checkCustomRessurect;;
		5) 
		  hapusRessurect;;
		$lastMenu)
		  echo "anda keluar dari program tmux";;
		*)
		  echo "tidak ada pilihan di program tmux";;
	esac
  	
  done

}

function changeLastSymlink(){
	local arr=() choose number=0 lenghtArr

	mapfile -t arr < <(find "$home/.tmux/resurrect" -type f -not -regex ".*tmux_resurrect_.*\.txt" | sort)
	lenghtArr=${#arr[@]}

	if [[ -n "$(echo "${arr[0]}")" ]]; then
		for i in "${arr[@]}"; do
		   ((number++))
			echo "$i" | sed -E "s|^.*\/|$number. |g"
		done
		echo "0. exit"
		read -p "pilih sesi resurrect :" choose

		if [ $choose -ge 0 ] && [ $choose -le $lenghtArr ]; then
		  if [ $choose != 0 ]; then
			  ln -sf "${arr[$choose-1]}" "$home/.tmux/resurrect/last"
			  echo "last symlink telah dirubah ke $(echo ${arr[$choose-1]} | sed -E "s|^.*/||g")"
		  else
			echo "anda keluar dari changeSymlink"
		  fi
		else
		  echo "pilihan tidak ditemukan"
		fi

		
	else
	  echo "tidak ada custom sesi tmux-resurrect buatanmu"
	fi
}


function checkLastSymlink(){
  local name
  name=$(readlink "$home/.tmux/resurrect/last")
  echo $name
}

function renameFileLastSymlink(){
  local name rename
  local pathRessurect="$home/.tmux/resurrect"
  name=$(readlink "$pathRessurect/last")
  echo "last symlink $name"

  read -p "rename file last symlink : " rename
  mv "$pathRessurect/$name" "$pathRessurect/$rename.txt"

  clear
  echo "filename telah berubah menjadi $rename.txt, ubah last symlink:"
  changeLastSymlink
}



function checkCustomRessurect(){
  local arr=() number=0
  mapfile -t arr < <(find $home/.tmux/resurrect/ -type f -not -regex ".*tmux_resurrect_.*\.txt" | sort)

	if [[ -n "$(echo "${arr[0]}")" ]]; then
	  echo "--custome resurrect session buatanmu--"
	  for i in "${arr[@]}"; do
		  ((number++))
		  echo "$i" | sed -E "s|^.*\/|$number. |g"
	  done
	else
	  echo "tidak ada custome resurrect session buatanmu"
	fi
	echo ""
}


function hapusRessurect(){
  rm -rf ~/.tmux/resurrect/tmux_resurrect_20*.txt; 
  echo ""
  echo "file telah dihapus"
  echo ""
}


tmux_menu


