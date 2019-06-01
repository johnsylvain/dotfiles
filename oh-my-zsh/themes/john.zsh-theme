PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg[magenta]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="⇣"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="⇡"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="⇣⇡"

function preexec() {
  preexec_called=1
}

function precmd() {
  if [ "$?" != 0 ] && [ "$preexec_called" = 1 ]; then
    PROMPT_PREFIX="%{$fg[red]%}$%{$reset_color%}"
    unset preexec_called;
  else
    PROMPT_PREFIX="$"
  fi
}

function git_remote_count() {
  local ahead=$(command git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
  local behind=$(command git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)

  if [[ $ahead -gt 0 ]] && [[ $behind -eq 0 ]]; then
    echo $(git_remote_status) $(echo $ahead | awk '{$1=$1};1')
  elif [[ $behind -gt 0 ]] && [[ $ahead -eq 0 ]]; then
    echo $(git_remote_status) $(echo $behind | awk '{$1=$1};1')
  else
    $(git_remote_status)
  fi
}

PROMPT='
%{$fg[cyan]%}%1~%{$reset_color%} $(git_prompt_info) $(git_remote_count)
$PROMPT_PREFIX '
