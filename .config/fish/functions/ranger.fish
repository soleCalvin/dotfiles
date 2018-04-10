function ranger
	if test (count $RANGER_LEVEL) -eq 0
		if count $argv > /dev/null
			/usr/sbin/ranger $argv
		else
			/usr/sbin/ranger
		end
	else
		exit
	end
end
