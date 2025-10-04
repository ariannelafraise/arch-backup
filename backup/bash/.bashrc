#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTFILESIZE=100000
export HISTSIZE=100000

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

## ETS aliases
alias vpnets='openconnect-sso --server accesvpn.etsmtl.ca'

## NAS aliases
alias nas-pdc-mount='sudo mount -t cifs -o credentials=/etc/samba/credentials,uid=1000,gid=1000,x-systemd.automount,_netdev //nas-arianne.pdc.ovh/PDC /nas/pdc'
alias nas-pdc-umount='sudo umount /nas/pdc'
alias nas-arianne-mount='sudo mount -t cifs -o credentials=/etc/samba/credentials,uid=1000,gid=1000,x-systemd.automount,_netdev //nas-arianne.pdc.ovh/Arianne /nas/arianne'
alias nas-arianne-umount='sudo umount /nas/arianne'

# SSH
eval $(ssh-agent) &> /dev/null
ssh-add ~/ssh_keys/github &> /dev/null
#ssh-add ~/ssh_keys/github_id_rsa &> /dev/null

if [[ "$TERM" != "xterm-kitty" ]]
then
  # ANSI Color Variables
  RESET="\[\033[0m\]"
  # 256-color mode
  CYAN="\[\033[38;5;117m\]"
  PINK="\[\033[38;5;213m\]"
  WHITE="\[\033[38;5;231m\]"
  LIGHT_PINK="\[\033[38;5;217m\]"
  # Prompt (colored)
  PS1='  { '"$CYAN"'\u'"$RESET"'@'"$PINK"'\h'"$RESET"' '"$WHITE"' \w'"$RESET"' } '"$LIGHT_PINK"''"$RESET"'  '
else
  eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/themes/trans.omp.json)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Java Oracle
export JAVA_HOME=$HOME/java/jdk1.8.0_451
export PATH=$PATH:$JAVA_HOME/bin

# Discord Cosmetics Automation Script
export PATH=$PATH:~/personal_dev/discord-cosmetics-automation

# pnpm
export PNPM_HOME="/home/arianne/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
