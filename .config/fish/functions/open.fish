function open
	if count $argv > /dev/null
		cmd.exe /C start $argv
	else
		explorer.exe .
	end
end
