# bash_profile
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# git-flow-completion
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion#homebrew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
