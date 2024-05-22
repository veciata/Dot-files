# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
_fzf_comprun(){
  local command=$1
  shift

  case "command" in 
    cd)            fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset)  fzf --preview "eval 'echo \$' {}"        "$@" ;;
    ssh)           fzf --preview 'dig {}'                   "$@" ;;
    *)             fzf --preview "--preview 'bat -n --color=always --line-range:500 {}'" "$@" ;;
  esac
}
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/auto-ls/auto-ls.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# elapsed_time fonksiyonunu tanımlayın
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
autoload -Uz compinit promptinit vcs_info
zstyle ':vcs_info:git:*' formats '(%b)'
precmd() {
    vcs_info
}
compinit -u
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

##aliases
alias lal="eza --tree --level=2"
alias vi="nvim"
alias neofetch="neofetch --ascii ~/.config/neofetch/turki.txt"
alias loadiso="sh ~/.zsh/mountiso.sh"
alias ls="lsd"
alias ll="lsd -l"
neofetch
alias back="chezmoi add"
alias bast="chezmoi status"
source ~/powerlevel10k/powerlevel10k.zsh-theme
if command -v zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Source the Lazyman shell initialization for aliases and nvims selector
# shellcheck source=.config/nvim-Lazyman/.lazymanrc
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
# Source the Lazyman .nvimsbind for nvims key binding
# shellcheck source=.config/nvim-Lazyman/.nvimsbind
[ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind
# Luarocks bin path
[ -d ${HOME}/.luarocks/bin ] && {
  export PATH="${HOME}/.luarocks/bin${PATH:+:${PATH}}"
}
eval "$(zoxide init zsh)"
