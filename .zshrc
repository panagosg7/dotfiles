
# cat zshrc >> /etc/zsh/zshrc
# or on a per user basis: cat zshrc >> ~/.zshrc
#PS1="%B[%3~]%#%b "
#PS1="%n@%m [%3~]%# "

if [[ ${TERM} == "screen-bce" || ${TERM} == "screen" ]]; then
  precmd () { print -Pn "\033k\033\134\033k%m[%1d]\033\134" }
  preexec () { print -Pn "\033k\033\134\033k%m[$1]\033\134" }
else
  precmd () { print -Pn "\e]0;%n@%m: %~\a" }
  preexec () { print -Pn "\e]0;%n@%m: $1\a" }
fi
PS1=$'%{\e[0;32m%}%m%{\e[0m%}:%3~> '
export PS1



# Autoload some useful stuff
autolist=(colors compinit)
for f in $autolist; do autoload -U $f; $f; done
unset f autolist

# Enable color support of ls
if [[ "$TERM" != "dumb" ]]; then
    if [[ -x `which dircolors` ]]; then
      eval `dircolors -b`
        alias 'ls=ls --color=auto'
    fi
fi

if [[ `hostname -s` != 'goto' ]]; then
  export PAGER="most"
fi

#keep history file between sessions
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt histignorespace
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# Aliases
alias ls='ls -G --color'
alias ll='ls -lha'
alias la='ls -ha'
alias lc='ls --color=never'
#alias rs='ls -rhsS'
alias l='ls -lh'
#alias s='ls -sh'
#alias 1='ls -1'

alias ..='cd ..'
alias ...='cd ../..'
alias -g '....'='../../..'

alias d='df -h'

alias 'grep=grep --colour'

# Typing errors...
alias 'cd..=cd ..'

# chmod
alias rw-='chmod 600'
alias rwx='chmod 700'
alias r--='chmod 644'
alias r-x='chmod 755'

# some useful aliases
alias md='mkdir -p'
alias rmd='rmdir'
alias hist='cat ~/.zsh_history | grep '
#alias du='du -shc'
alias wgetr='wget -r --no-parent --reject "index.html*"'
#alias dvd='mount /media/dvd'
#alias dvde='eject /media/dvd'


#vga shortcuts
alias xvga='xrandr --output VGA1 --auto --output LVDS1 --off'
alias xlvds='xrandr --output LVDS1 --auto --output VGA1 --off'

# I really like screen
#alias rsm='screen -r'
#alias ssu='screen -S su su'
#alias irc-new='screen -S irc irssi'
#alias sssh='screen -S ssh ssh'
#alias ronin='screen -S ronin ssh ronin@ntua'
#alias strans='screen -S transcode env LD_LIBRARY_PATH=/usr/local/lib zsh'
# I use renameutils a lot
#alias ren='qmv -f do'

# Since I use debian most of the time, these come in handy.
# No need for apt-get install in there, zsh completion handles apt-get real good ;)
alias apt='aptitude'
alias apts='aptitude search'
alias aptc='apt-cache search'
alias aptf='apt-file search'
alias show='apt-cache show'
alias dbuild='dpkg-buildpackage -uc -B -rfakeroot'
alias di='dpkg -i'
#alias psa='psgrep'
#alias gtp='topgrep'

#export GDFONTPATH='/usr/share/fonts/truetype/msttcorefonts/'
#alias sml='rlwrap sml'

#export JAVA_HOME=/usr/lib/jvm/java-6-sun-1.6.0.12
#export PYTHONDOCS=/usr/share/doc/python2.5-doc/html

# Prompts for confirmation after 'rm *' etc
# Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
#setopt RM_STAR_WAIT
alias 'rm *'='rm -i *'

#remove latex temporary files
alias texrm='rm *.aux; rm *.out; rm *.toc; rm *.log; rm *.idx; rm *.nav; rm *.snm; rm *~'

# Background processes aren't killed on exit of shell
#setopt AUTO_CONTINUE

# Don’t write over existing files with >, use >! instead
setopt NOCLOBBER

# Don’t nice background processes
setopt NO_BG_NICE

#network aliases
alias greedy='ssh greedy.softlab.ntua.gr'
alias xgreedy='ssh -X greedy.softlab.ntua.gr'
alias godel='ssh godel.ucsd.edu'
alias goto='ssh goto.ucsd.edu'
alias syno='ssh pvekris.synology.me'
alias synoroot='ssh root@pvekris.synology.me'

# less with color
alias vless='vim -u /usr/share/vim/vim73/macros/less.vim'

# Auto correct commands
#setopt CORRECT

# p is aliased to $PWD
alias p=pwd

# PDF viewer (just type 'file.pdf')
if [[ -x `which okular` ]]; then
    alias -s 'pdf=kfmclient exec'
    else
        if [[ -x `which gpdf` ]]; then
          alias -s 'pdf=gpdf'
              else
                if [[ -x `which evince` ]]; then
                      alias -s 'pdf=evince'
                fi
        fi
fi

if [[ -x `which gwenview` ]]; then
    alias -s 'jpg=kfmclient exec'
fi

if [[ -x `which texmaker` ]]; then
    alias -s 'tex=kfmclient exec'
fi

# Usage: simple-extract <file>
# Description: extracts archived files (maybe)
ext () {
  if [[ -f $1 ]]
  then
    case $1 in
      *.tar.bz2)  bzip2 -v -d $1      ;;
      *.tar.gz)   tar -xvzf $1        ;;
      *.rar)      unrar x $1            ;;
      *.deb)      ar -x $1            ;;
      *.bz2)      bzip2 -d $1         ;;
      *.lzh)      lha x $1            ;;
      *.gz)       gunzip -d $1        ;;
      *.tar)      tar -xvf $1         ;;
      *.tgz)      gunzip -d $1        ;;
      *.tbz2)     tar -jxvf $1        ;;
      *.zip)      unzip $1            ;;
      *.Z)        uncompress $1       ;;
      *)          echo "'$1' Error. Please go away" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Usage: cmpr <file> (<type>)
# Description: compresses files or a directory.  Defaults to tar.gz
  cmpr() {
        if [ $2 ]; then
                case $2 in
                        tgz | tar.gz)   tar -zcvf$1.$2 $1 ;;
                        tbz2 | tar.bz2) tar -jcvf$1.$2 $1 ;;
                        tar.Z)          tar -Zcvf$1.$2 $1 ;;
                        tar)            tar -cvf$1.$2  $1 ;;
                        gz | gzip)      gzip           $1 ;;
                        bz2 | bzip2)    bzip2          $1 ;;
                        *)
                        echo "Error: $2 is not a valid compression type"
                        ;;
                esac
        else
                cmpr $1 tar.gz
        fi
  }

# Usage: show-archive <archive>
# Description: view archive without unpack
  show-archive() {
        if [[ -f $1 ]]
        then
                case $1 in
                        *.tar.gz)      gunzip -c $1 | tar -tf - -- ;;
                        *.tar)         tar -tf $1 ;;
                        *.tgz)         tar -ztf $1 ;;
                        *.zip)         unzip -l $1 ;;
                        *.bz2)         bzless $1 ;;
			*.rar)         unrar l $1 ;;
                        *)             echo "'$1' Error. Please go away" ;;
                esac
        else
                echo "'$1' is not a valid archive"
        fi
  }

    status() {
        print ""
        print "Date..: "$(date "+%Y-%m-%d %H:%M:%S")""
        print "Shell.: Zsh $ZSH_VERSION (PID = $$, $SHLVL nests)"
        print "Term..: $TTY ($TERM), $BAUD bauds, $COLUMNS x $LINES cars"
        print "Login.: $LOGNAME (UID = $EUID) on $HOST"
        print "System: $(cat /etc/[A-Za-z]*[_-][rv]e[lr]*)"
        print "Uptime:$(uptime)"
        print ""
  }

  
# Export PATH
export PATH=./node_modules/.bin:$HOME/.bin/zgrviewer:$HOME/.root/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games:$HOME/.cabal/bin:$HOME/.root/bin

export TERM='xterm-256color'


# Bind Keys
bindkey ";5D" backward-word
bindkey ";5C" forward-word
export WORDCHARS=''


LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=01;30:ow=01;32:st=37;44:ex=32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'



: <<'COMMENT'
# PROMPT

function precmd {

    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))


    ###
    # Truncate the path if it's too long.
    
    PR_FILLBAR=""
    PR_PWDLEN=""
    
    local promptsize=${#${(%):---(%n@%m:%l)---()--}}
    local pwdsize=${#${(%):-%~}}
    
    if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
	    ((PR_PWDLEN=$TERMWIDTH - $promptsize))
    else
	PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))..${PR_HBAR}.)}"
    fi


    ###
    # Get APM info.

    if which ibam > /dev/null; then
	PR_APM_RESULT=`ibam --percentbattery`
    elif which apm > /dev/null; then
	PR_APM_RESULT=`apm`
    fi
}


setopt extended_glob
preexec () {
    if [[ "$TERM" == "screen" ]]; then
	local CMD=${1[(wr)^(*=*|sudo|-*)]}
	echo -n "\ek$CMD\e\\"
    fi
}


setprompt () {
    ###
    # Need this so the prompt will work.

    setopt prompt_subst


    ###
    # See if we can use colors.

    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
	colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
	eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
	eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
	(( count = $count + 1 ))
    done
    PR_NO_COLOUR="%{$terminfo[sgr0]%}"


    ###
    # See if we can use extended characters to look nicer.
    
    typeset -A altchar
    set -A altchar ${(s..)terminfo[acsc]}
    PR_SET_CHARSET="%{$terminfo[enacs]%}"
    PR_SHIFT_IN="%{$terminfo[smacs]%}"
    PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
    PR_HBAR=${altchar[q]:--}
    PR_ULCORNER=${altchar[l]:--}
    PR_LLCORNER=${altchar[m]:--}
    PR_LRCORNER=${altchar[j]:--}
    PR_URCORNER=${altchar[k]:--}

    
    ###
    # Decide if we need to set titlebar text.
    
    case $TERM in
	xterm*)
	    PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'
	    ;;
	screen)
	    PR_TITLEBAR=$'%{\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\e\\%}'
	    ;;
	*)
	    PR_TITLEBAR=''
	    ;;
    esac
    
    
    ###
    # Decide whether to set a screen title
    if [[ "$TERM" == "screen" ]]; then
	PR_STITLE=$'%{\ekzsh\e\\%}'
    else
	PR_STITLE=''
    fi
    
    
    ###
    # APM detection
    
    if which ibam > /dev/null; then
	PR_APM='$PR_RED${${PR_APM_RESULT[(f)1]}[(w)-2]}%%(${${PR_APM_RESULT[(f)3]}[(w)-1]})$PR_LIGHT_BLUE:'
    elif which apm > /dev/null; then
	PR_APM='$PR_RED${PR_APM_RESULT[(w)5,(w)6]/\% /%%}$PR_LIGHT_BLUE:'
    else
	PR_APM=''
    fi
    
    
    ###
    # Finally, the prompt.

    PROMPT='$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}\
$PR_CYAN$PR_SHIFT_IN$PR_ULCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT(\
$PR_GREEN%(!.%SROOT%s.%n)$PR_GREEN@%m:%l\
$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_HBAR${(e)PR_FILLBAR}$PR_BLUE$PR_HBAR$PR_SHIFT_OUT(\
$PR_MAGENTA%$PR_PWDLEN<...<%~%<<\
$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_URCORNER$PR_SHIFT_OUT\

$PR_CYAN$PR_SHIFT_IN$PR_LLCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT(\
%(?..$PR_LIGHT_RED%?$PR_BLUE:)\
${(e)PR_APM}$PR_YELLOW%D{%H:%M}\
$PR_LIGHT_BLUE:%(!.$PR_RED.$PR_WHITE)%#$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_NO_COLOUR '

    RPROMPT=' $PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_BLUE$PR_HBAR$PR_SHIFT_OUT\
($PR_YELLOW%D{%a,%b%d}$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_LRCORNER$PR_SHIFT_OUT$PR_NO_COLOUR'

    PS2='$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_BLUE$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT(\
$PR_LIGHT_GREEN%_$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT$PR_NO_COLOUR '
}


setprompt
COMMENT

autoload -U zmv
setopt extended_glob


#List only driectories
alias lsd='ls -l | grep "^d"'

#Json nice viewer
alias pp='python -mjson.tool'

export DJS_DIR=$HOME/Documents/research/djs

export NODE_PATH='$HOME/.root/lib/jsctags:${NODE_PATH}'

if [[ `hostname -s` != 'goto' ]]; then
  source $HOME/.git_prompt.zsh
fi
