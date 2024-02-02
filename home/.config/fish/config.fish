# #peco
# function fish_user_key_bindings
#   bind \cr peco_select_history
#   # 最近見たディレクトリに移動
#   bind \cx\cr peco_recentd
# end

# alias g='git'
# alias s='cd (ghq list --full-path | peco)'

# export GOPATH=$HOME

# set PATH $HOME/bin $PATH

# set PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH

# set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
# set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths

# if type -q /home/linuxbrew/.linuxbrew
#   eval (/home/linuxbrew/.linuxbrew/bin shellenv)
# end

# if type -q anyenv
#   status --is-interactive; and source (anyenv init -|psub)
# end

# set -g theme_display_date no
# set -g theme_display_cmd_duration no

if test -d /home/linuxbrew/.linuxbrew
  eval (/home/linuxbrew/.linuxbrew/bin shellenv)
end

if test -d /opt/homebrew
  eval (/opt/homebrew/bin/brew shellenv)
end

if type -q starship
  starship init fish | source
end

alias g='git'

set -g fish_user_paths $HOME/bin $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths

set -x FZF_LEGACY_KEYBINDINGS 0

if type -q anyenv
  status --is-interactive; and source (anyenv init -|psub)
end

if test -d (brew --prefix asdf)
  source (brew --prefix asdf)/libexec/asdf.fish
end

if type -q mise
  mise activate fish | source
end

if test -d $HOME/.cargo/bin
  set -g fish_user_paths $HOME/.cargo/bin $fish_user_paths
end

if test -d $HOME/.deno/bin
  set -g fish_user_paths $HOME/.deno/bin $fish_user_paths
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.fish.inc' ]; . '~/google-cloud-sdk/path.fish.inc'; end
