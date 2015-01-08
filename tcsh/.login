if( `ps ax | grep ssh-agent | sed -e '/grep\|launch/d' | wc -l` <= 0  ) then
	eval `ssh-agent > ~/.ssh/agent.$HOST.tmp` >& /dev/null
	source ~/.ssh/agent.$HOST.tmp >& /dev/null
	ssh-add

	~/dotfiles/update.sh -l &

else
	source ~/.ssh/agent.$HOST.tmp >& /dev/null
endif
