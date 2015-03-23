(ffap-bindings)

(add-hook 'dired-load-hook (lambda ()
                  (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)))
