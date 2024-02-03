# Set PATH
set brew_path "/opt/homebrew/bin"
set brew_opt_path "/opt/homebrew/opt"
set nvm_path "$HOME/.nvm"

set -gx PATH "$brew_path" $PATH
set -gx PATH "$brew_opt_path/php@7.4/bin" $PATH
set -gx PATH "$brew_opt_path/php@7.4/sbin" $PATH

set -gx PATH "$brew_opt_path/php@7.3/bin" $PATH
set -gx PATH "$brew_opt_path/php@7.3/sbin" $PATH

set -gx PATH "$brew_opt_path/mysql/bin" $PATH

set -gx PATH "$brew_opt_path/vue/cli/bin" $PATH

# Set NVM_DIR
set -gx NVM_DIR "$nvm_path"
set -gx NVM_DIR (brew --prefix nvm)

# Load NVM
# if test -s "$brew_opt_path/nvm/nvm.sh"
#     source "$brew_opt_path/nvm/nvm.sh"
# else if test -s "$brew_opt_path/nvm/nvm.sh"
#     source "$brew_opt_path/nvm/nvm.sh"
# end

# if test -s "$brew_opt_path/nvm/etc/bash_completion.d/nvm"
#     source "$brew_opt_path/nvm/etc/bash_completion.d/nvm"
# end

# Set PATH for Flutter
set -gx PATH "$PATH:$HOME/flutter/bin"

# Additional PATH exports
set -gx PATH "/opt/homebrew/opt/php@7.4/bin" $PATH
set -gx PATH "/opt/homebrew/opt/php@7.4/sbin" $PATH
set -gx PATH "/opt/homebrew/opt/php@8.1/sbin" $PATH
set -gx PATH "/opt/homebrew/opt/php@8.1/bin" $PATH
set -gx PATH "/opt/homebrew/opt/php@7.3/bin" $PATH
set -gx PATH "/opt/homebrew/opt/php@7.3/sbin" $PATH
set -gx PATH "/opt/homebrew/opt/python@3.11/bin" $PATH
set -gx PATH "/opt/homebrew/opt/python@3.11/sbin" $PATH

# Load Powerlevel10k if available
# if test -f ~/.p10k.zsh
#     source ~/.p10k.zsh
# end

# Set VOLTA_HOME
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx PATH "/opt/homebrew/opt/php@8.0/bin" $PATH
set -gx PATH "/opt/homebrew/opt/php@8.0/sbin" $PATH
set -gx PATH "/opt/homebrew/opt/python@3.11/bin" $PATH
set -gx PATH "/opt/homebrew/opt/python@3.11/sbin" $PATH

# Alias
alias ll 'ls -alF'

# Prompt

