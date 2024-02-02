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

(leaf ivy
  :doc "Incremental Vertical completYon"
  :req "emacs-24.5"
  :tag "matching" "emacs>=24.5"
  :added "2020-10-20"
  :url "https://github.com/abo-abo/swiper"
  :emacs>= 24.5
  :ensure t
  :config
  (ivy-mode t))

(leaf counsel
  :doc "Various completion functions using Ivy"
  :req "emacs-24.5" "swiper-0.13.0"
  :tag "tools" "matching" "convenience" "emacs>=24.5"
  :added "2020-10-21"
  :url "https://github.com/abo-abo/swiper"
  :emacs>= 24.5
  :ensure t
  :after swiper)

(leaf swiper
  :doc "Isearch with an overview. Oh, man!"
  :req "emacs-24.5" "ivy-0.13.0"
  :tag "matching" "emacs>=24.5"
  :added "2020-10-20"
  :url "https://github.com/abo-abo/swiper"
  :emacs>= 24.5
  :ensure t
  :after ivy
  :bind ("C-s" . swiper))

(leaf leaf-convert
  :doc "basic"
  :custom ((inhibit-startup-message . t)
	   (scroll-step . 1)
	   (kill-whole-line . t)
	   (show-paren-mode . t)
	   (recentf-max-menu-items . 20)
	   (recentf-max-saved-items . 100)
	   (indent-tabs-mode . nil))
  :config
  (global-hl-line-mode t)
  (global-display-line-numbers-mode t)
  (column-number-mode t)
  (recentf-mode t))

(leaf leaf-convert
  :doc "global keybindings"
  :bind
  (("C-c ;" . comment-dwim)
   ("\C-h" . delete-backward-char)))

(leaf leaf-convert
  :doc "window style"
  :when window-system
  :config
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (set-scroll-bar-mode nil)
  (toggle-frame-maximized))

(leaf savehist
  :doc "Save minibuffer history"
  :tag "builtin"
  :added "2020-10-20"
  :custom
  (history-length . 10000)
  :config
  (savehist-mode 1))

(leaf neotree
  :doc "A tree plugin like NerdTree for Vim"
  :req "cl-lib-0.5"
  :added "2020-10-23"
  :url "https://github.com/jaypei/emacs-neotree"
  :ensure t
  :bind
  (("<f8>" . neotree-toggle)))

(leaf leaf-convert
  :config
  (add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font Mono"))
  (set-face-attribute 'default t :font "FiraCode Nerd Font Mono"))

(leaf iflipb
  :doc "Interactively flip between recently visited buffers"
  :added "2020-11-02"
  :url "https://github.com/jrosdahl/iflipb"
  :ensure t
  :bind
  (("M-s-<left>" . iflipb-previous-buffer)
   ("M-s-<right>" . iflipb-next-buffer))
  :custom
  ((iflipb-wrap-around . t)
   (iflipb-ignore-buffers . nil)))

(leaf super-save
  :doc "Auto-save buffers, based on your activity."
  :req "emacs-24.4"
  :tag "convenience" "emacs>=24.4"
  :added "2020-11-05"
  :url "https://github.com/bbatsov/super-save"
  :emacs>= 24.4
  :ensure t
  :config
  (super-save-mode +1))

(leaf leaf-convert
  :setq ((delete-by-moving-to-trash . t)))

(leaf open-junk-file
  :doc "Open a junk (memo) file to try-and-error"
  :tag "tools" "convenience"
  :added "2020-11-22"
  :url "http://www.emacswiki.org/cgi-bin/wiki/download/open-junk-file.el"
  :ensure t
  :bind (("C-x j" . open-junk-file))
  :setq ((open-junk-file-format . "~/Documents/junk/%Y/%m/%Y-%m-%d-%H%M%S.md")))

(leaf markdown-mode
  :doc "Major mode for Markdown-formatted text"
  :req "emacs-25.1"
  :tag "itex" "github flavored markdown" "markdown" "emacs>=25.1"
  :added "2021-04-15"
  :url "https://jblevins.org/projects/markdown-mode/"
  :emacs>= 25.1
  :ensure t)
