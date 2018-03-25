function ranger
	if test (count $RANGER_LEVEL) -eq 0
		if count $argv > /dev/null
			/usr/bin/ranger $argv
		else
			/usr/bin/ranger
		end
	else
		exit
	end
end
