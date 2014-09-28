;; C-hでバックスペース
(define-key global-map "\C-h" 'delete-backward-char)

;; C-oで動的略語展開
(define-key global-map "\C-o" 'dabbrev-expand)

;; コメントアウト
(define-key global-map "\C-c;" 'comment-region)

;; コメント解除
(define-key global-map "\C-c:" 'uncomment-region)


(global-set-key (kbd "M-x") 'helm-M-x)
