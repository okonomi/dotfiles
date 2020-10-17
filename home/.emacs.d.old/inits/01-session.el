(add-hook 'after-init-hook 'session-initialize)
(setq session-initialize '(de-saveplace session keys menus places)
      session-globals-include '((kill-ring 50)             ;; kill-ring の保存件数
                                (session-file-alist 50 t)  ;; カーソル位置を保存する件数
                                (file-name-history 200)))  ;; ファイルを開いた履歴を保存する件数
