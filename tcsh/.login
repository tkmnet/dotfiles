if( `w -h $USER | wc -l` <= 2  ) then
	eval `ssh-agent > ~/.ssh/agent.tmp` >& /dev/null
	ssh-add

	~/dotfiles/update.sh -l &

else
	source ~/.ssh/agent.tmp >& /dev/null
endif
