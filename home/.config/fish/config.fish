#peco
function fish_user_key_bindings
  bind \cr peco_select_history
  # 最近見たディレクトリに移動
  bind \cx\cr peco_recentd
end

alias g='git'
alias s='cd (ghq list --full-path | peco)'

if type -q $HOME/.anyenv/bin/anyenv
  set PATH $HOME/.anyenv/bin $PATH
  status --is-interactive; and source (anyenv init -|psub)
end

export GOPATH=$HOME/src
set PATH $GOPATH/bin $PATH

set PATH $HOME/bin $PATH


set -g theme_display_date no
set -g theme_display_cmd_duration no
