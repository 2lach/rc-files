#!/usr/local/bin/bash

# items to sync and there absolute paths
USERNAME="pi"
VIMRC="/home/$USERNAME/.vimrc"
ZSHENV="/home/pi/.config/zsh/.zshenv"
ZSHRC="/home/pi/.config/zsh/.zshrc"
HTOPRC="/home/pi/.config/htop/htoprc"

# INIT_NVIM="/Users/$USERNAME/.config/nvim/init.vim"
# SETTINGS_JSON="/Users/$USERNAME/Library/Application Support/Code/User/settings.json"
# REPO="/home/pi/.config/rc-files"

# files
declare -a files=("$VIMRC" "$ZSHENV" "$ZSHRC" "$HTOPRC")
# "$INIT_VIM" "$SETTINGS_JSON")

for i in "${files[@]}"; do
	# verify file path
	if [ ! -f "$i" ]; then
		echo "$i path invalid"
		exit 1
	else
		# sync file(s)
		echo "sync file: $i"
		cp "$i" .
	fi
done

# add job to crontab with:
# ===============
# sudo crontab -e
# ===============
# run 14:10 daily
# 10 14 * * * /usr/local/bin/bash /Users/stefanlachmann/projects/rc-files/cron-sync.sh
# ===============
