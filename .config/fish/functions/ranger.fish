function ranger
	if test (count $RANGER_LEVEL) -eq 0
		if count $argv > /dev/null
			/usr/local/bin/ranger $argv
		else
			/usr/local/bin/ranger
		end
	else
		exit
	end
end
