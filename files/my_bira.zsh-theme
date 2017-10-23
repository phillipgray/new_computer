# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"


if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n%{$reset_color%}'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n%{$reset_color%}'
fi

local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}‹rb: $(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[red]%}‹rb: $(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi
local pyenv=''
if which pyenv &> /dev/null; then
  pyenv='%{$fg[green]%}‹py: $(pyenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
fi
local nodenv=''
if which nodenv &> /dev/null; then
  nodenv='%{$fg[gray]%}‹n: $(nodenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
fi
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="╭─${user_host} ${current_dir} ${rvm_ruby} ${pyenv} ${nodenv} ${git_branch}
╰─%B$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%}› %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗ "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔︎ "
