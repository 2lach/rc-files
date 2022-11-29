#!/usr/local/bin/bash

# items to sync and there absolute paths
USERNAME="stefanlachmann"
VIMRC="/Users/$USERNAME/.vim/.vimrc"
ZSHENV="/Users/$USERNAME/.config/zsh/.zshenv"
ZSHRC="/Users/$USERNAME/.config/zsh/.zshrc"
HTOPRC="/Users/$USERNAME/.config/htop/htoprc"
INIT_VIM="/Users/$USERNAME/.config/nvim/init.vim"
SETTINGS_JSON="/Users/$USERNAME/Library/Application Support/Code/User/settings.json"
REPO="/Users/$USERNAME/projects/rc-files"




# files
declare -a files=("$VIMRC" "$ZSHENV" "$ZSHRC" "$HTOPRC" "$INIT_VIM" "$SETTINGS_JSON")

for i in "${files[@]}"; do
	echo "sync files: $i"
  cp "$i" "$REPO/$i" .
done


# add job to crontab with:
# ===============
# sudo crontab -e 
# ===============
# run 14:10 daily
# 10 14 * * * /usr/local/bin/bash /Users/stefanlachmann/projects/rc-files/cron-sync.sh
# ===============