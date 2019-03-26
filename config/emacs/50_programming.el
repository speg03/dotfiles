;; Make scripts executable
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

(use-package company
  :diminish
  :bind (("M-/" . company-complete)
         :map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous)
         ("C-s" . company-filter-candidates)
         ("C-i" . company-complete-selection)
         ("M-h" . company-show-doc-buffer)
         :map company-search-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :init
  (global-company-mode 1))

(use-package dockerfile-mode)

(use-package flycheck
  :diminish
  :hook (sh-mode . flycheck-mode))

(use-package lsp-mode
  :hook (python-mode . lsp)
  :bind ("C-M-f" . lsp-format-buffer)
  :config
  (use-package lsp-ui
    :hook (lsp-mode . lsp-ui-mode))
  (use-package company-lsp))

(use-package go-mode)

(use-package markdown-mode
  :mode "\\.md\\'"
  :init
  (setq markdown-command "pandoc"))

(use-package matlab
  :ensure matlab-mode)

(use-package pipenv
  :diminish
  :hook (python-mode . pipenv-mode))

(use-package terraform-mode)

(use-package yaml-mode
  :mode ("\\.yml\\'" "\\.yaml\\'"))

(use-package web-mode
  :mode ("\\.js\\'" "\\.erb\\'" "\\.html?\\'")
  :init
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
