if( `ps ax | grep ssh-agent | wc -l` <= 1  ) then
	eval `ssh-agent > ~/.ssh/agent.$HOST.tmp` >& /dev/null
	source ~/.ssh/agent.$HOST.tmp >& /dev/null
	ssh-add

	/bin/sh -c "~/dotfiles/update.sh -l &"

else
	source ~/.ssh/agent.$HOST.tmp >& /dev/null
endif
