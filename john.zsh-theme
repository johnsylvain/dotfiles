LOCATION="%{$fg[cyan]%}%1~%{$reset_color%}"
TIME="%{$fg[magenta]%}%t%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="on "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="⇣"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="⇡"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="⇕"

RPROMPT='$TIME'
PROMPT='
$LOCATION $(git_prompt_info) $(git_remote_status)
$ '
