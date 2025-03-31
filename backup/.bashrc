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
alias backup-config='./personal_dev/arch-backup/arch_backup.sh'

# SSH
eval $(ssh-agent) &> /dev/null
ssh-add ~/ssh_keys/github_id_rsa &> /dev/null

# Prompt (colored)
PS1='  { \[\033[38;5;117m\]\u\[\033[0m\]@\[\033[38;5;213m\]\h\[\033[0m\] \[\033[38;5;231m\] \w\[\033[0m\] } \[\033[38;5;217m\]\[\033[0m\]  '

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
