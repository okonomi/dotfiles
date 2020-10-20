;; <leaf-install-code>
(eval-and-compile
  (customize-set-variable
   'package-archives '(("org" . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("gnu" . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    (leaf hydra :ensure t)
    (leaf el-get :ensure t)
    (leaf blackout :ensure t)

    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))
;; </leaf-install-code>

(leaf cus-edit
  :doc "tools for customizing Emacs and Lisp packages"
  :tag "builtin" "faces" "help"
  :custom `((custom-file . ,(locate-user-emacs-file "custom.el"))))

(leaf leaf
  :config
  (leaf leaf-convert :ensure t)
  (leaf leaf-tree
    :ensure t
    :custom ((imenu-list-size . 30)
             (imenu-list-position . 'left))))

(leaf macrostep
  :ensure t
  :bind (("C-c e" . macrostep-expand)))

(leaf dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t))

(leaf persistent-scratch
  :ensure t
  :config
  (persistent-scratch-setup-default))

(leaf leaf-convert
  :doc "basic"
  :custom ((inhibit-startup-message . t)
	   (scroll-step . 1)
	   (kill-whole-line . t)
	   (show-paren-mode . t)
	   (recentf-max-menu-items . 20)
	   (recentf-max-saved-items . 100))
  :bind
  ("C-c ;" . comment-dwim)
  ("\C-h" . delete-backward-char)
  :config
  (global-hl-line-mode t)
  (global-display-line-numbers-mode t)
  (column-number-mode t)
  (recentf-mode t))

(leaf leaf-convert
  :doc "window style"
  :when window-system
  :config
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (set-scroll-bar-mode nil)
  (toggle-frame-maximized))

(leaf multiple-cursors
  :doc "Multiple cursors for Emacs."
  :req "cl-lib-0.5"
  :added "2020-10-20"
  :ensure t
  :bind ("C-S-l" . mc/edit-lines))

(leaf git-gutter
  :doc "Port of Sublime Text plugin GitGutter"
  :req "emacs-24.3"
  :tag "emacs>=24.3"
  :added "2020-10-20"
  :url "https://github.com/emacsorphanage/git-gutter"
  :emacs>= 24.3
  :ensure t
  :config
  (global-git-gutter-mode t))

(leaf magit
  :doc "A Git porcelain inside Emacs."
  :req "emacs-25.1" "async-20200113" "dash-20200524" "git-commit-20200516" "transient-20200601" "with-editor-20200522"
  :tag "vc" "tools" "git" "emacs>=25.1"
  :added "2020-10-20"
  :emacs>= 25.1
  :ensure t
  :after git-commit with-editor)
