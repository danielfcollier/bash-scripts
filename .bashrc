# .bashrc

#
### Source global definitions
#
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#
### User specific environment
#
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

#
### Uncomment the following line if you don't like systemctl's auto-paging feature:
#
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

#
### Testing How to Work with Commands
#

mkcd ()
{
  mkdir -p -- "$1" && cd -P -- "$1"
}


#
### Shortcuts: General
#

shopt -s cdable_vars
alias openbash='vi ~/.bashrc'
export scriptsroot=$HOME/scripts

# touch <file_name>
# > <file_name>
# vi, vim, pico, nano
# ls -l
# ls -a

## sudo dnf update
## history
## top

## pwd

## cat
## grep
## env
## cat /etc/os-release
## hostnamectl 

## gunzip < 'fileName.tgz | tar xvf

## git switch -c <BRANCH_NAME>

#
### Shortcuts: Personal
#

export myroot=$HOME/github

alias mycheckout='bash ~/scripts/bash-scripts/git-mycheckout.sh'
alias mydownloads='cd ~/Downloads'

#
### Shortcuts: Tuna
#

export tunaroot=$HOME/tuna/gitlab

alias tunacheckout='bash ~/scripts/bash-scripts/git-tunacheckout.sh'
alias tunadownloads='cd ~/tuna/Downloads'

alias tunain='sudo ip link set enp0s20f0u1 up | sudo ifconfig enp0s20f0u1 up'
alias tunaout='sudo ip link set enp0s20f0u1 down | sudo ifconfig enp0s20f0u1 down'

#
### Git Scripts
#
alias gitwhois='git config --list'
alias gitnew='bash ~/scripts/bash-scripts/git-newbranch.sh'
alias gitcommit='bash ~/scripts/bash-scripts/git-commit.sh'
alias gitmerge='bash ~/scripts/bash-scripts/git-merge.sh'

#
### Configurations
#
alias setview='gsettings set org.gnome.desktop.interface text-scaling-factor'
alias putwatch='dconf watch /' 

#
### EOF
#
unset rc
