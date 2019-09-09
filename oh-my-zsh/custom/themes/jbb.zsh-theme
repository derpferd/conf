# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background and the font Inconsolata.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# http://ysmood.org/wp/2013/03/my-ys-terminal-theme/
# Mar 2013 ys

# Machine name.
#function box_name {
#    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
#}

# Get Type of unix (Not reliable)
function unix_type_f() {
  if (( $+commands[lsb_release] )) ; then  # Only on ubuntu/debain
    echo "Ubuntu"
  elif (( $+commands[brew] )) ; then # only mac if brew is installed
    echo "OS X"
  elif (( $+commands[pacman] )) ; then # only arch linux has this
    echo "Arch"
  fi
}

local unix_type='$(unix_type_f)'


#function git_prompt_info() {
#  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
#}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# VCS
YS_VCS_PROMPT_PREFIX1=" %{$fg[white]%}on%{$reset_color%} "
YS_VCS_PROMPT_PREFIX2=":%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$fg_bold[green]%} ]%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}✖︎"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}●"

# Git info.
local git_info='$(git_prompt_info)'
#ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}[%{$reset_color%} %{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX "
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"


# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $
PROMPT="%{$fg[white]%}(%* ${unix_type}) \
%(?..%{$fg[red]%}<%{$fg_bold[red]%}%?%{$reset_color%}%{$fg[red]%}> )\
${git_info}\
%{$terminfo[bold]$fg[yellow]%}[%{$reset_color%} \
%{$fg[red]%}%n\
%{$fg[white]%}: \
%{$terminfo[bold]$fg[blue]%}${current_dir}%{$reset_color%} \
%{$terminfo[bold]$fg[yellow]%}]%{$reset_color%}
%{$terminfo[bold]$fg[red]%}→ %{$reset_color%}"

#if [[ "$unix_type" == "Ubuntu" ]]; then
RPROMPT="$(hostname)"
#else
#RPROMPT=""
#fi

if [[ "$USER" == "root" ]]; then
PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$bg[yellow]%}%{$fg[cyan]%}%n%{$reset_color%} \
%{$fg[white]%}at \
%{$fg[green]%}$(box_name) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info} \
%{$fg[white]%}[%*]
%{$terminfo[bold]$fg[red]%}→ %{$reset_color%}"
fi
