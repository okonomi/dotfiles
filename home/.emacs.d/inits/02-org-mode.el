(setq org-todo-keywords '("TODO" "STARTED" "|" "DONE")
   org-todo-interpretation 'sequence)

;; http://passingloop.tumblr.com/post/10150860851/org-clock-in-if-starting
;; http://wp-nhoriguchi.rhcloud.com/?p=87
(defun sacha/org-clock-in-if-starting ()
  "Clock in when the task is marked STARTED."
  (when (and (string= org-state "STARTED")
             (not (string= org-last-state org-state)))
    (org-clock-in)))
(add-hook 'org-after-todo-state-change-hook
	  'sacha/org-clock-in-if-starting)
(defadvice org-clock-in (after sacha activate)
  "Set this task's status to 'STARTED'."
  (org-todo "STARTED"))

(defun sacha/org-clock-out-if-waiting ()
  "Clock in when the task is marked STARTED."
  (when (and (string= org-state "WAITING")
             (not (string= org-last-state org-state)))
    (org-clock-out)))
(add-hook 'org-after-todo-state-change-hook
	  'sacha/org-clock-out-if-waiting)


;; キーバインドの設定
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; org-default-notes-fileのディレクトリ
(setq org-directory "~/org/")

;; アジェンダ表示の対象ファイル
(setq org-agenda-files (list org-directory))

;; スピードコマンド有効化
(setq org-use-speed-commands t)
