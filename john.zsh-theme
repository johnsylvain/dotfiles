USER_NAME="%{$fg[magenta]%}%n%{$reset_color%}"
LOCATION="%{$fg[cyan]%}%1~%{$reset_color%}"
TIME="%{$fg[cyan]%}%t%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"

RPROMPT='$TIME'
PROMPT='
$USER_NAME $LOCATION $(git_prompt_info)
$ '

