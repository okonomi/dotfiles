;; cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

(load-theme 'dracula t)

;; カスタマイズ用のファイルを設定
(setq custom-file "~/.emacs.d/custom_settings.el")
;; カスタマイズ用ファイルをロード
(load custom-file t)
