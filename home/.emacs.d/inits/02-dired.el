(ffap-bindings)

(add-hook 'dired-load-hook (lambda ()
                  (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)))

;; via http://nishikawasasaki.hatenablog.com/entry/20120222/1329932699
;; via http://tam5917.hatenablog.com/entry/20130126/1359206522
;; ファイルなら別バッファで、ディレクトリなら同じバッファで開く
(defun dired-open-in-accordance-with-situation ()
    (interactive)
    (cond ((string-match "\\(?:\\.\\.?\\)"
                         (format "%s" (thing-at-point 'filename)))
           (dired-find-alternate-file))
          ((file-directory-p (dired-get-filename))
           (dired-find-alternate-file))
          (t
           (dired-find-file))))
;; dired-find-alternate-file の有効化
(put 'dired-find-alternate-file 'disabled nil)
;; RET 標準の dired-find-file では dired バッファが複数作られるので
;; dired-find-alternate-file を代わりに使う
(define-key dired-mode-map (kbd "RET") 'dired-open-in-accordance-with-situation)
(define-key dired-mode-map (kbd "a") 'dired-find-file)
