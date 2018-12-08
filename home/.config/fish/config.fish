#peco
function fish_user_key_bindings
  bind \cr peco_select_history
  # 最近見たディレクトリに移動
  bind \cx\cr peco_recentd
end

alias g='git'
alias s='cd (ghq list --full-path | peco)'

set PATH $HOME/.anyenv/bin $PATH
status --is-interactive; and source (anyenv init -|psub)

export GOPATH=$HOME/src
set PATH $GOPATH/bin $PATH
