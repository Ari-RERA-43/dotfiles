
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

export PATH=$PATH:"$HOME/.local/bin"

export EDITOR='/usr/bin/nvim'
export VISUAL=$EDITOR 
export PAGER='nvimpager'
export MANPAGER='nvim +Man!'

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt autocd correct histignorespace
unsetopt beep
bindkey -e

# Shell completion
zstyle :compinstall filename '/home/ari/.zshrc'
autoload -Uz compinit select-word-style
select-word-style bash
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}'
zstyle ':completion::complete:*' gain-privileges 1
compinit

ENABLE_CORRECTION="true"
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; fi
#if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh; fi

# https://wiki.archlinux.org/title/zsh#Colors
[[ "$COLORTERM" == (24bit|truecolor) || "${terminfo[colors]}" -eq '16777216' ]] || zmodload zsh/nearcolor

# Prompts
## Fix broken output
autoload -Uz add-zsh-hook

function reset_broken_terminal () {
	printf '%b' '\e[0m\e(B\e)0\017\e[?5l\e7\e[0;0r\e8'
}

add-zsh-hook -Uz precmd reset_broken_terminal
## My Prompt
autoload -Uz promptinit
promptinit
fpath=("$HOME/.zprompts" "$fpath[@]")
prompt_custom_setup() {
	PS1='%F{27}'$'\ue0c7''%K{27}%F{15} %n %K{39}%F{27}'$'\ue0b0'' %F{15}%~ %k%F{39}'$'\ue0b0''%f%k '
	RPROMPT='%F{207}'$'\ue0b2''%K{207}%F{15} %? %F{201}'$'\ue0b2''%K{201}%F{15} %M %F{165}'$'\ue0b2''%K{165}%F{15} %* %k%F{165}'$'\ue0c6''%f%k'
}
prompt_themes+=( custom )
prompt custom

# Aliases
if [ -f ~/.config/shell/aliases ]; then
    . ~/.config/shell/aliases
fi

# Autorun
if [ -x $HOME/.local/bin/welcome ]; then $HOME/.local/bin/welcome; fi
if [ -e /home/ari/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ari/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
