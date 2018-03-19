function du
	if count $argv > /dev/null
		command du $argv
	else
		command du -ha -d1
	end
end
