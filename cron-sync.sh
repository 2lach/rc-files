#!/usr/bin/bash

# items to sync and there absolute paths
USERNAME="stefan"
VIMRC="/Users/$USERNAME/.vim/.vimrc"
ZSHENV="/Users/$USERNAME/zsh/.zshenv"
ZSHRC="/Users/$USERNAME/zsh/.zshrc"
HTOPRC="/Users/$USERNAME/.config/htop/htoprc"
INIT_VIM="/Users/$USERNAME/.config/nvim/init.vim"
SETTINGS_JSON="/Users/$USERNAME/Library/Application Support/Code/User/settings.json"
# REPO="/Users/$USERNAME/projects/rc-files"

# INIT_NVIM="/Users/$USERNAME/.config/nvim/init.vim"
# SETTINGS_JSON="/Users/$USERNAME/Library/Application Support/Code/User/settings.json"
# "$INIT_VIM" "$SETTINGS_JSON")

function succesful() {
	# sunc succesful
	touch /Users/$USERNAME/rc-files-synced.txt
	local dt=$(which date).
	[ -x "$dt" ] && "$dt" >>"/Users/$USERNAME/rc-files-synced.txt"
}

# rc files
declare -a files=("$VIMRC" "$ZSHENV" "$ZSHRC" "$HTOPRC" "$INIT_VIM" "$SETTINGS_JSON")
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