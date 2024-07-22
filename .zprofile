# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# brew
if [[ -x /usr/local/bin/brew ]] ; then
  eval "$(/usr/local/bin/brew shellenv)"
elif [[ -x /opt/homebrew/bin/brew ]]
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# see /etc/zprofile
. ~/.sh/exports

