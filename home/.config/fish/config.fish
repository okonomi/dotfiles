#peco
function fish_user_key_bindings
  bind \cr peco_select_history
  # 最近見たディレクトリに移動
  bind \cx\cr peco_recentd
end

alias g='git'
alias s='cd (ghq list --full-path | peco)'

if type -q $HOME/.anyenv/bin/anyenv
  set -g fish_user_paths $HOME/.anyenv/bin $fish_user_paths
  eval (anyenv init - | source)
end

export GOPATH=$HOME

set PATH $HOME/bin $PATH


set -g theme_display_date no
set -g theme_display_cmd_duration no
