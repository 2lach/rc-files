#!/data/data/com.termux/files/usr/bin/bash

# items to sync and there absolute paths
VIMRC="/data/data/com.termux/files/home/.vim/.vimrc"
ZSHENV="/data/data/com.termux/files/home/.config/zsh/.zshenv"
ZSHRC="/data/data/com.termux/files/home/.config/zsh/.zshrc"
# HTOPRC="/home/pi/.config/htop/htoprc"
REPO="/data/data/com.termux/files/home/.config/rc-files"
USERHOME="/data/data/com.termux/files/home/"
function succesful() {
	# sunc succesful
	touch $USERHOME/rc-files-synced.txt
	local dt=$(which date).
	[ -x "$dt" ] && "$dt" >>"$USERHOME/rc-files-synced.txt"
}

# rc files
declare -a files=(
	"$VIMRC"
	"$ZSHENV"
	"$ZSHRC"
)

for i in "${files[@]}"; do
	# verify file path
	if [ ! -f "$i" ]; then
		echo "$i path invalid"
		exit 1
	else
		# sync file(s)
		echo "sync file: $i"
		cp "$i" "$REPO/"
	fi
	# verify

done

succesful
# add job to crontab with:
# ===============
# sudo crontab -e
# ===============
# run 14:10 daily
# 10 14 * * * /data/data/com.termux/files/usr/bin/bash
# /usr/local/bin/bash /Users/stefanlachmann/projects/rc-files/cron-sync.sh /data/data/com.termux/files/home/.config/rc-files
# ===============
