# Load Antigen
source "$HOME/.antigen/antigen.zsh"

# Load various lib files
antigen bundle robbyrussell/oh-my-zsh lib/

# Antigen Bundles
antigen-use oh-my-zsh
antigen bundle git
antigen bundle tmuxinator
antigen bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search
antigen bundle rupa/z

# For SSH, starting ssh-agent is annoying
antigen bundle ssh-agent

# Node Plugins
# antigen bundle coffee
# antigen bundle node
# antigen bundle npm

# Python Plugins
# antigen bundle pip
# antigen bundle python
# antigen bundle virtualenv

# Git
antigen-bundle arialdomartini/oh-my-git

# Theme
# antigen theme arialdomartini/oh-my-git-themes oppa-lana-style
# antigen theme arialdomartini/oh-my-git-themes arialdo-pathinline
# antigen theme arialdomartini/oh-my-git-themes arialdo-granzestyle
antigen theme robbyrussell/oh-my-zsh themes/bureau


# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
    antigen bundle osx
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None so far...

elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    antigen bundle cygwin
fi

# Restore this!!!
antigen bundle panagosg7/zsh-files

antigen-apply

