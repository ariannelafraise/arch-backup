#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTFILESIZE=100000
export HISTSIZE=100000

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias backup-config='~/personal_dev/arch-backup/arch_backup.sh'
alias wireshark='XDG_CURRENT_DESKTOP=GNOME wireshark'
alias macfetch='hyfetch --distro macaroni'
alias winfetch='hyfetch --distro windows'
alias tkt-c-un-mac='swww img ~/Pictures/macos-big-sur-apple-layers-fluidic-colorful-wwdc-stock-4096x2304-1455.jpg --transition-type wipe --transition-fps 255 && macfetch'
alias tkt-c-windows='swww img ~/Pictures/wallhaven-o5k319.jpg --transition-type wipe --transition-fps 255 && winfetch'
alias tkt-c-linux='swww img "${MY_WALLPAPER}" --transition-type wipe --transition-fps 255'

# SSH
eval $(ssh-agent) &> /dev/null
ssh-add ~/ssh_keys/github_id_rsa &> /dev/null

# ANSI Color Variables
#RESET="\[\033[0m\]"
# 256-color mode
#CYAN="\[\033[38;5;117m\]"
#PINK="\[\033[38;5;213m\]"
#WHITE="\[\033[38;5;231m\]"
#LIGHT_PINK="\[\033[38;5;217m\]"
# Prompt (colored)
#PS1='  { '"$CYAN"'\u'"$RESET"'@'"$PINK"'\h'"$RESET"' '"$WHITE"' \w'"$RESET"' } '"$LIGHT_PINK"''"$RESET"'  '

#eval "$(oh-my-posh init bash --config .config/oh-my-posh/themes/M365Princess.omp.json)"
eval "$(oh-my-posh init bash --config .config/oh-my-posh/themes/velvet.omp.json)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/arianne/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
