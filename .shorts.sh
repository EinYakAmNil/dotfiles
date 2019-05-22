# Personal aliases and functions

function git-settings {
	cd ~/SetInfos
	cp ~/.shorts.sh ~/.vimrc ~/.bashrc ~/SetInfos/
	cp ~/.config/i3/config ~/SetInfos/i3config
	cp ~/.config/i3status/config ~/SetInfos/i3statusconfig
	git add .bashrc .vimrc i3config i3statusconfig .shorts.sh
	git commit
}

function mkcd {
	mkdir "$@"
	cd "$@"
}

function dl-playlist {
	youtube-dl "https://www.youtube.com/playlist?list=PLuN8omoxqHiO6i26_7EyaKJCj7kPVcFwq"
	notify-send "Finish downloading playlist"
	bash ~/customs/to_name.bash
	cd ~/ToRename
	vim to_rename.bash
	bash to_rename.bash
	picard *.mp3
	mv *.mp3 ~/Musik
}

function csv {
	column -s, -t < "$@" | less -#2 -N -S
}

function todo {
	cd ~/Dokumente/Tex/
	vim todo.tex
}

alias ..='cd ..'
alias ...='cd ../..'
alias cbmac='ssh linkai@131.188.171.226'
alias bccb13='ssh py54myte@bccb13.biologie.uni-erlangen.de'
alias bashrc='vim ~/.bashrc && source $_'
alias shorts='vim ~/.shorts.sh && source $HOME/.bashrc'
alias vimrc='vim ~/.vimrc'
alias python='python3'
alias pip='pip3'
alias pymods='python -c "help(\"modules\")" > ~/SetInfos/pymods.txt'
alias faubox='sh /usr/share/FAUbox/FAUbox-Client.sh'
alias -- -='cd ~-'
alias camera='vlc v4l2:///dev/video0'
alias fixbg='dbus-send --type=method_call --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval "string:global.reexec_self()"'
alias pdf='zathura --fork'
alias new-manga='python ~/customs/manga-update.py'
alias vi='/usr/bin/vim'
alias clip='xclip -sel clip'
alias i3conf='vim ~/.config/i3/config'
alias statusconf='vim ~/.config/i3status/config'
alias wp='feh --bg-fill'
