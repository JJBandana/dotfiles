# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jojo/.zshrc'
alias vim=nvim
# alias grep=rg
alias la='ls -la'
alias ls=eza
alias cls=clear

autoload -Uz compinit
compinit
# End of lines added by compinstall
export PATH=$PATH:/home/jojo/.local/bin
export PATH=~/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

export EDITOR=nvim

eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
eval "$(oh-my-posh init zsh --config "space")"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec Hyprland || echo "Error: Couldn't run Hyprland, is it installed?"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/share/nvm/init-nvm.sh" ] && source /usr/share/nvm/init-nvm.sh
