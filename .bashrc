# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
# if [[ $- != *i* ]] ; then
# 	# Shell is non-interactive.  Be done now!
# 	return
# fi
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
#source /etc/X11/xinit/xinitrc.d/80-dbus

# ~/.pam_environment

# Put your fun stuff here.
#. /etc/profile.d/vte-2.91.sh

# enable color support of ls and also add handy aliases
  if [ -x /usr/bin/dircolors ]; then
     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
     alias ls='ls --color=auto'
     #alias dir='dir --color=auto'
     #alias vdir='vdir --color=auto'

     alias grep='grep --color=auto'
     alias fgrep='fgrep --color=auto'
     alias egrep='egrep --color=auto'
  fi
alias ipmiview="/home/mgordeev/app/IPMIView_2.9.23_jar_20130709/IPMIView20.sh"
alias ll="ls -la --color\=auto"
#alias grep="grep -H --color\=auto"
alias cemacscli="emacsclient -c -nw -a emacs"
alias emacscli="emacsclient -c -a emacs"
alias kssh="kitty +kitten ssh"
alias ssh="TERM=linux ssh"

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >> /dev/null

export DE='gnome'
export DM='awesome'
export XDG_CURRENT_DESKTOP=GNOME
export EDITOR='emacsclient -c -nw -a emacs'
export VISUAL='emacsclient -c -a emacs'
export RANGER_LOAD_DEFAULT_RC=FALSE
export PATH="$HOME/bin:/opt/bin:$PATH"
export PATH="$PATH:/usr/local/MATLAB/R2017a/bin/:${HOME}/.cask/bin:/usr/lib/llvm/5/bin"
export PATH="/home/mgordeev/.emacs.d/.cask/26.1/elpa/rtags-20180925.641/rtags-2.20/bin:$PATH"
export PATH="$HOME/app/ccollab-client/:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.emacs.doom/bin:$PATH"
# tfc
export PATH="$PATH:/opt/tee-clc-14.134.0/"

export JAVA_HOME="/usr/lib/jvm/default/"
export INSTALL4J_JAVA_HOME_OVERRIDE="/usr/lib/jvm/default/"

export PATH=$PATH:/home/mgordeev/app/vsts-cli/bin

export ANT_HOME=/opt/ant/default
export PATH="$PATH:$ANT_HOME/bin"
source '/home/mgordeev/app/vsts-cli/vsts.completion'

eval "$(starship init bash)"
