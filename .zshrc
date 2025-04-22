# zsh options

### options ###
setopt POSIX_BUILTINS
setopt POSIX_ALIASES
### ZSH features
setopt NOTIFY
setopt ZLE

## history ##
setopt SHARE_HISTORY
HISTFILE=~/.zhistory
setopt HIST_IGNORE_DUPS
setopt HIST_VERIFY
setopt HIST_BEEP
setopt HIST_FIND_NO_DUPS
HISTSIZE=1000
SAVEHIST=1000

### stack ###
DIRSTACKSIZE=50
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_TO_HOME
setopt PUSHD_IGNORE_DUPS
setopt LIST_BEEP
#setopt NO_LIST_BEEP
setopt MARK_DIRS

# job control
setopt CHECK_JOBS
setopt HUP
setopt NOTIFY

## auto correct ##
setopt CORRECT
setopt CORRECT_ALL
CORRECT_IGNORE='rspec'

## completion ##
setopt ALWAYS_TO_END
setopt AUTO_LIST
setopt AUTO_MENU
setopt AUTO_NAME_DIRS
setopt AUTO_PARAM_SLASH
setopt AUTO_REMOVE_SLASH
setopt CHASE_LINKS
setopt COMPLETE_IN_WORD
setopt EXTENDED_GLOB
setopt GLOB_DOTS
setopt HASH_LIST_ALL
setopt MENU_COMPLETE
setopt NOGLOBDOTS

zmodload zsh/zutil

# help
autoload run-help
alias help='run-help'
[ "$OS" = "OSX" ] && HELPDIR=/usr/local/share/zsh/help

autoload -U pick-web-browser
zstyle ':mime:*' x-browsers konqueror firefox chrome links2
alias -s html=pick-web-browser

# recent directories
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':completion:*:*:cdr:*:*' menu selection
# end recent directories

ZLS_COLORS=$LS_COLORS

# autoload -U promptinit
# promptiniwt;

cdpath=(.. ~)
watch=(notme)
LOGCHECK=120
WATCHFMT='%n %a %l from %m at %t.'

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' use-compctl true
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*' squeeze-slashes true

zstyle :compinstall filename '/home/yves/.zshrc'

# check me
type brew &>/dev/null && FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

command -v kops &> /dev/null && source <(kops completion zsh)

# SSH keYs
# FIXME replace with ~/.sh/keychain
eval "$(ssh-agent -s)" &> /dev/null
ssh-add --apple-use-keychain ~/.ssh/id_inthememory &> /dev/null
#
### ssh hosts completion
if [[ -r $HOME/.ssh/known_hosts ]];
then
  local _myhosts
  _myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
  zstyle ':completion:*' hosts $_myhosts
fi
### end ssh hosts completion

# mise
eval "$(mise activate zsh)"
# asdf
# . "$HOME/.asdf/asdf.sh"
# append completions to fpath
# fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
# compinit is done in ~/.zsh/zi
# autoload -Uz compinit && compinit

# vim keybinding
bindkey -v

# home, end & Co key bindings
# konsole
bindkey "\e[H" beginning-of-line # Début
bindkey "\e[F" end-of-line # Fin
bindkey "\e[3~" delete-char
bindkey "^R" history-incremental-search-backward # Rechercher
# urxvt
bindkey "^[[7~" beginning-of-line # Début
bindkey "^[[8~" end-of-line # Fin
bindkey "^[[3~" delete-char
#gnome terminal
bindkey "^[OF" end-of-line
bindkey "^[OH" beginning-of-line

# aliases
source ~/.zsh/aliases
source ~/.sh/aliases

# dotfiles
source ~/.sh/dotfiles

# customs functions
. ~/.sh/functions.zsh
. ~/.zsh/functions.d/*

# prompt
# source "$HOME/.zsh/spaceship/spaceship.zsh"
# . ~/.zsh/prompt

# zi
source ~/.zsh/zi

function blastoff(){
  echo "🚀"
}
function set_win_title(){
  echo -ne "\033]0; $(basename "$PWD") \007"
}
starship_precmd_user_func="blastoff"
starship_precmd_user_func="set_win_title"


eval "$(starship init zsh)"
