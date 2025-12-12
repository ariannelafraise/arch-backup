# If not running interactively, don't do anything
[[ -o interactive ]] || return

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt autocd beep notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit
# End of lines added by compinstall

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="suvash"

# autoupdate oh-my-zsh
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13

HIST_STAMPS="mm/dd/yyyy"

plugins=(git colorize colored-man-pages python)
# kitty plugin available

ZSH_COLORIZE_TOOL=chroma

source $ZSH/oh-my-zsh.sh

## Dotfiles aliases
alias backup-config='~/personal_dev/arch-backup/arch_backup.sh'
alias apply-config='~/personal_dev/arch-backup/arch_apply.sh'

## Modified default commands aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias wireshark='XDG_CURRENT_DESKTOP=GNOME wireshark'

## Fun aliases
alias macfetch='hyfetch --distro macaroni'
alias winfetch='hyfetch --distro windows'
alias tkt-c-un-mac='swww img ~/Wallpapers/macos.jpg --transition-type wipe --transition-fps 255 && macfetch'
alias tkt-c-windows='swww img ~/Wallpapers/wallhaven-o5k319.jpg --transition-type wipe --transition-fps 255 && winfetch'
alias gyatt='git'

## QOL aliases
alias config-huenicorn='brave 127.0.0.1:8215'
alias desktop='hyprland'
alias disk-usage-here='du -h --max-depth=1'

## ETS aliases
alias vpnets='openconnect-sso --server accesvpn.etsmtl.ca'

## NAS aliases
alias nas-pdc-mount='sudo mount -t cifs -o credentials=/etc/samba/credentials,uid=1000,gid=1000,x-systemd.automount,_netdev //nas-arianne.pdc.ovh/PDC /nas/pdc'
alias nas-pdc-umount='sudo umount /nas/pdc'
alias nas-arianne-mount='sudo mount -t cifs -o credentials=/etc/samba/credentials,uid=1000,gid=1000,x-systemd.automount,_netdev //nas-arianne.pdc.ovh/Arianne /nas/arianne'
alias nas-arianne-umount='sudo umount /nas/arianne'

# SSH aliases
alias rpi-connect='ssh arianne@192.168.240.90'

# SSH
#eval $(ssh-agent) &> /dev/null
#ssh-add ~/ssh_keys/github &> /dev/null
SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

if [[ "$TERM" = "xterm-kitty" ]]; then
  eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/trans.omp.json)"
fi

# Java Oracle
export JAVA_HOME=$HOME/java/jdk1.8.0_451
export PATH=$PATH:$JAVA_HOME/bin

# Discord Cosmetics Automation Script
export PATH=$PATH:~/personal_dev/discord-cosmetics-automation
export PATH=$PATH:/opt/nitch

# pnpm
export PNPM_HOME="/home/arianne/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
