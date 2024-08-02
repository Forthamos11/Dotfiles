
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"


ZSH_THEME="powerlevel10k/powerlevel10k"


plugins=(git colorize command-not-found zsh-autosuggestions fast-syntax-highlighting tmux)
source $ZSH/oh-my-zsh.sh
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/home/jannis/.bun/_bun" ] && source "/home/jannis/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


####################
#USER CONFIGURATION#
####################


alias dotbuild="dotnet build --output build"
alias ls="exa -GA --icons"
alias tree="exa -a --tree --icons --level=2"

eval $(thefuck --alias)

