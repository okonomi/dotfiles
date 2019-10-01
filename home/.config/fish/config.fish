#peco
function fish_user_key_bindings
  bind \cr peco_select_history
  # 最近見たディレクトリに移動
  bind \cx\cr peco_recentd
end

alias g='git'
alias s='cd (ghq list --full-path | peco)'

if type -q $HOME/.anyenv/bin/anyenv
  set PATH $HOME/bin $HOME/.anyenv/bin $PATH
end
if type -q anyenv
  status --is-interactive; and source (anyenv init -|psub)
end

if type -q /home/linuxbrew/.linuxbrew
  eval (/home/linuxbrew/.linuxbrew/bin shellenv)
end

export GOPATH=$HOME

set PATH $HOME/bin $PATH

set PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH

set -g theme_display_date no
set -g theme_display_cmd_duration no
