function fish_prompt
	# set -l textcol yellow
	# set -l bgcol    blue
	# set -l arrowcol green
	# set_color $textcol -b $bgcol
	set_color yellow
	echo -n (basename $PWD)" > "
end
