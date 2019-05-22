#!/bin/bash

sed -i 's|DISABLE_UPDATE_PROMPT=\$DISABLE_UPDATE_PROMPT zsh -f \$ZSH/tools/check_for_upgrade.sh|DISABLE_UPDATE_PROMPT=\$DISABLE_UPDATE_PROMPT zsh \$ZSH/tools/check_for_upgrade.sh|g' ~/.oh-my-zsh/oh-my-zsh.sh
