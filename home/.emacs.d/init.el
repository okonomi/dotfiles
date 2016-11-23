;; cask

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
