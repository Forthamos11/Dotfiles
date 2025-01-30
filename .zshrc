
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"


# ZSH_THEME="powerlevel10k/powerlevel10k"


plugins=(git colorize command-not-found zsh-autosuggestions fast-syntax-highlighting tmux)
source $ZSH/oh-my-zsh.sh
# alias ohmyzsh="mate ~/.oh-my-zsh"

# bun completions
[ -s "/home/jannis/.bun/_bun" ] && source "/home/jannis/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


####################
#USER CONFIGURATION#
####################


alias dotbuild="dotnet build --output build"
alias ls="exa -ga --icons"
alias tree="exa -a --tree --icons --level=2"
alias vim="nvim"
alias code="code ."

eval $(thefuck --alias)
eval "$(starship init zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
