# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
export EDITOR=nvim
export VISUAL=nvim

export PNPM_HOME="$HOME/.local/share/pnpm"
export BUN_INSTALL="$HOME/.bun"

typeset -U path # -U evita duplicados en el PATH
path=(
  $BUN_INSTALL/bin
  $PNPM_HOME
  $HOME/.local/bin
  $HOME/bin
  $HOME/.cargo/bin
  $path
)
export PATH

[[ -t 0 ]] && stty erase '^?'

autoload -Uz compinit
zstyle :compinstall filename '$HOME/.zshrc'

setopt extendedglob
if [[ -n ~/.zcompdump(#qN.m-1) ]]; then
  compinit -C -u
else
  compinit -u
fi

zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
  zcompile "$zcompdump"
fi

# --- Aliases ---

alias vim=nvim
alias la='eza -la'
alias cls=clear
alias tree='eza --tree --level=3 --ignore-glob "node_modules|dist|build|.git"'
alias myip="ip route get 1.1.1.1 | grep -oP 'src \K\S+'"
alias git-ai="bun /home/jojo/Projects/git-commiter/git-ai.ts"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "/home/jojo/.bun/_bun"

# Google Cloud SDK
if [ -d "$HOME/google-cloud-sdk" ]; then
    # Cargar el path es barato
    source "$HOME/google-cloud-sdk/path.zsh.inc"
    # Cargar el autocompletado es CARO. 
    # Solo lo cargamos si realmente estamos en una sesión de trabajo
    [[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]] && source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

eval "$(oh-my-posh init zsh --config "space")"


# Added by Antigravity CLI installer
export PATH="/home/jojo/.local/bin:$PATH"

# opencode
export PATH=/home/jojo/.opencode/bin:$PATH
