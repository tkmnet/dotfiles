eval `ssh-agent` >& /dev/null
ssh-add

~/dotfiles/update.sh -l &
