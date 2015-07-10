# ~/.profile: executed by Bourne-compatible login shells.

EDITOR=mcedit; export EDITOR

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n
