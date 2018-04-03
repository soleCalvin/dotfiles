function ytdl
	youtube-dl -i -f "bestaudio[ext=m4a]" -x --embed-thumbnail -o '%(title)s.%(ext)s' $argv
end
