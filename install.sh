#!/bin/bash

#####################
#   Managed files   #
#####################
files="vim           
       vimrc         
       zshrc         
       bashrc        
       screenrc      
       git_prompt.zsh
       ctags 
       tmux.conf"

cd "$(dirname "${BASH_SOURCE}")"
  
filename=$HOME/backup_$(date +%b_%d_%Y_%H_%M_%S)

backup () {
  echo
  read -p "Press [Enter] key to start backup..."

  #Backup
  mkdir $filename
  for file in $files; do
    echo "Backing up $HOME/.$file ..."
    mv $HOME/.$file $filename 2> /dev/null  
  done
  echo
  echo "Backed up configuration files in: $filename"
}


doIt () {
  echo
  read -p "Press [Enter] key to start install..."
  for file in $files; do
    echo "Copying $HOME/.$file ..."
    rsync -avzrq $file $HOME/.$file
  done

}

## Start ##

if [ -d ".git" ] ; then
  git pull
fi

if [ ! -d $filename ]; then
  read -p "Some of your existing configuration files might be overwritten. 
Would you like a backup of your current installation? 
    y: Backup and clean install
    u: Update existing files (WARNING: no backup)
    n: Abort " yun

  while true; do
  case $yun in
      [Yy]* ) backup; doIt; exit;;
      [Uu]* ) doIt; exit;;
      [Nn]* ) exit;;
      * ) echo "Please answer yes or no.";;
  esac
  done

else
  echo "Cannot create backup file: '$filename' already exists"
  exit
fi

unset doIt
