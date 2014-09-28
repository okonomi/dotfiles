;;; バックアップファイルを作らない
(setq make-backup-files nil)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;; 動的略語展開で大文字小文字を区別
(setq dabbrev-case-fold-search nil)

;; スクロールを一行ずつにする
(setq scroll-step 1)

;; バッファ末尾に余計な改行コードが入るのを防ぐ
(setq next-line-add-newlines nil)

;; インデントでタブ文字を使用しないようにする
(setq indent-tabs-mode nil)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;; *scratch* バッファからメッセージを消す
(setq initial-scratch-message "")

;; 対応する括弧の強調表示
(show-paren-mode t)

;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "%s : %%f" (system-name)))

;; マークした箇所の視覚化
(setq-default transient-mark-mode t)

;; 現在行をハイライト
(global-hl-line-mode t)
(defface my-hl-line-face
  '((((class color) (background dark))  ; カラーかつ, 背景が dark ならば,
     (:background "#040404" t))   ; 背景を黒に.
    (((class color) (background light)) ; カラーかつ, 背景が light ならば,
     (:background "ForestGreen" t))     ; 背景を ForestGreen に.
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)

;; 選択範囲の反転
(setq-default transient-mark-mode t)

;; 全角スペースとタブを目立つように表示する
(defface my-face-b-1 '((t (:background "medium aquamarine"))) nil)
(defface my-face-b-2 '((t (:background "gray26"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(
     ("　" 0 my-face-b-1 append)
     ("\t" 0 my-face-b-2 append)
     ("[ ]+$" 0 my-face-u-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook 'find-file-hooks '(lambda ()
                              (if font-lock-mode
                                  nil
                                (font-lock-mode t))) t)

;; 現在の関数名をモードラインに表示する
(which-function-mode true)
