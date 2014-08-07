# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# non-printable characters must be enclosed inside \[ and \]
PS1='\[\033]0;\u@\h: \w\007\[\033[1;33m\]' # set window title
PS1="$PS1"'\u\[\033[1;0m\]\[\033[1;34m\]@\[\033[0m\]\[\033[1;31m\]\h ' # user@host<space>
PS1="$PS1"'\[\033[1;32m\]'        # change color
PS1="$PS1"'\w'                    # current working directory
PS1="$PS1"'\[\033[0m\]'           # change color
PS1="$PS1"'$(parse_git_branch)$ ' # prompt with git brand: always $
PS1="$PS1"'$ ' # prompt: always $

#PS1="\[\033]0;\w\007\[\033[1;33m\]\u\[\033[1;0m\]\[\033[1;34m\]@\[\033[0m\]\[\033[1;31m\]\h \[\033[1;32m\]\w\\[\033[1;0m\]$ ";

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

if [ -e /usr/share/symfony2-autocomplete/symfony2-autocomplete.bash ]; then
    . /usr/share/symfony2-autocomplete/symfony2-autocomplete.bash
fi
