USER=" [%{$fg[magenta]%}%n%{$reset_color%}]"
LOCATION=" [%{$fg[cyan]%}%(4~|/%3~|%~)%{$reset_color%}]"
TIME="%{$fg[blue]%}%t%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="[%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}○%{$reset_color%}"

RPROMPT='$(git_prompt_info)$TIME'
PROMPT="
┌$USER$LOCATION
└ ▶ "
