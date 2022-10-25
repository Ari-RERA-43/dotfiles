# Ari43's bash aliases.
# ========================================================================

# General
alias nv='nvim'
alias v='vim'
alias more='less' # A classic
alias kitty-config='nvim ~/.config/kitty/kitty.conf'
alias kitty-conf='nvim ~/.config/kitty/kitty.conf'
alias untar='tar -fvxz'              
alias sha256='shasum -a 256'
alias sha512='shasum -a 512'
alias mkdir='mkdir -pv' # Make new directories recursively. For example, running "mkdir ./folder1/folder2/" makes ./folder1/ with folder2/ inside it without complaining. Also makes mkdir list out the directories that were made.
alias mkd='mkdir'
alias cl='clear'
alias cls='clear' # The clear screen command from Windows
alias nano='nano -l' # Always use line numbers in Nano
alias ping='ping -c 4'
alias wq='exit' # I've accidentally done this a few times
alias :wq='exit'
alias q='exit'
alias sdn='shutdown now'
alias unzip='7z x'

# Scripts
alias hello='~/scripts/welcome'
alias welcome='~/scripts/welcome'

# ls
alias ls='ls --color=auto' # Just in case it isn't in ~/.bashrc for some reason
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# Other
alias fixvm-hgfs='sudo vmhgfs-fuse .host:/ /mnt/hgfs/ -o allow_other -o uid=1000'
alias setvm-1440='xrandr --output Virtual1 --mode 2560x1440'
