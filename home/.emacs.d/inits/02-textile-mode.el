(autoload 'textile-mode "textile-mode.el"
  "Major mode for editing Textile files" t)

(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))
