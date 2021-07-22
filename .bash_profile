#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


# Set SSH to use gpg-agent
# unset SSH_AGENT_PID
# if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#     export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
# fi

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >> /dev/null

export DE='gnome'
export DM='awesome'
export TERM='konsole'
export XDG_CURRENT_DESKTOP=GNOME
export EDITOR='emacsclient -c -nw -a emacs'
export VISUAL='emacsclient -c -a emacs'
export RANGER_LOAD_DEFAULT_RC=FALSE
export PATH="$HOME/bin:/opt/bin:$PATH"
export PATH="$PATH:/usr/local/MATLAB/R2017a/bin/:${HOME}/.cask/bin:/usr/lib/llvm/5/bin"
export PATH="/home/mgordeev/.emacs.d/.cask/26.1/elpa/rtags-20180925.641/rtags-2.20/bin:$PATH"
export PATH="$HOME/app/ccollab-client/:$PATH"
export PATH="$HOME/go/bin:$PATH"

export JAVA_HOME="/usr/lib/jvm/default/"
export INSTALL4J_JAVA_HOME_OVERRIDE="/usr/lib/jvm/default/"

export PATH=$PATH:/home/mgordeev/app/vsts-cli/bin

export ANT_HOME=/opt/ant/default
export PATH="$PATH:$ANT_HOME/bin"

source '/home/mgordeev/app/vsts-cli/vsts.completion'
