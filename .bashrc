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
source /etc/X11/xinit/xinitrc.d/80-dbus

# ~/.pam_environment

# Put your fun stuff here.
. /etc/profile.d/vte-2.91.sh

alias ipmiview="/home/mgordeev/app/IPMIView_2.9.23_jar_20130709/IPMIView20.sh"
alias ll="ls -la --color\=auto"
alias grep="grep -H --color\=auto"
alias cemacscli="emacsclient -c -nw -a emacs"
alias emacscli="emacsclient -c -a emacs"

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >> /dev/null

export DE='xfce4'
export DM='awesome'
export TERM='konsole'
export PATH="$HOME/bin:/opt/bin:$PATH"
export EDITOR='emacsclient -c -nw -a emacs'
export VISUAL='emacsclient -c -a emacs'
export RANGER_LOAD_DEFAULT_RC=FALSE
