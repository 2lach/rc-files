#!/usr/bin/bash

# items to sync and there absolute paths
USERNAME="pi"
VIMRC="/home/$USERNAME/.vimrc"
ZSHENV="/home/pi/.config/zsh/.zshenv"
ZSHRC="/home/pi/.config/zsh/.zshrc"
HTOPRC="/home/pi/.config/htop/htoprc"
REPO="/home/pi/.config/rc-files"

# INIT_NVIM="/Users/$USERNAME/.config/nvim/init.vim"
# SETTINGS_JSON="/Users/$USERNAME/Library/Application Support/Code/User/settings.json"
# "$INIT_VIM" "$SETTINGS_JSON")

function succesful() {
	# sunc succesful
	touch /home/pi/rc-files-synced.txt
	local dt=$(which date).
	[ -x "$dt" ] && "$dt" >>"/home/pi/rc-files-synced.txt"
}

# rc files
declare -a files=(
	"$VIMRC"
	"$ZSHENV"
	"$ZSHRC"
	"$HTOPRC"
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
done

# verify
succesful

# add job to crontab with:
# ===============
# sudo crontab -e
# ===============
# run 14:10 daily
# 10 14 * * * /usr/local/bin/bash /Users/stefanlachmann/projects/rc-files/cron-sync.sh
# ===============
