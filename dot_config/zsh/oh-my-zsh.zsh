export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP="$HOME/.cache/zsh/zcompdump"

mkdir -p "$HOME/.cache/zsh/zcompcache"

plugins=(fzf zsh-autosuggestions fast-syntax-highlighting)
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/zcompcache"

[[ ! -f "$ZSH/oh-my-zsh.sh" ]] || source "$ZSH/oh-my-zsh.sh"
