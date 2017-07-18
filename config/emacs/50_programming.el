;; Make scripts executable
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

(use-package company
  :diminish company-mode
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

(use-package company-jedi
  :after company
  :init
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t)
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-to-list 'company-backends 'company-jedi))

(use-package dockerfile-mode)

(use-package flycheck
  :init
  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'sh-mode-hook 'flycheck-mode))

(use-package go-mode)

(use-package markdown-mode
  :mode "\\.md\\'"
  :init
  (setq markdown-command "pandoc"))

(use-package matlab
  :ensure matlab-mode)

(use-package py-isort)
(use-package py-yapf
  :after (python py-isort)
  :bind (:map python-mode-map
              ("C-M-f" . python-reformat-buffer))
  :init
  (defun python-reformat-buffer ()
    "Reformat python codes in the current buffer."
    (interactive)
    (py-isort-buffer)
    (py-yapf-buffer)))

(use-package pyenv-mode
  :init
  (add-hook 'python-mode-hook 'pyenv-mode))

(use-package pyenv-mode-auto)

(use-package terraform-mode)

(use-package yaml-mode
  :mode ("\\.yml\\'" "\\.yaml\\'"))

(use-package web-mode
  :mode ("\\.js\\'" "\\.erb\\'" "\\.html?\\'")
  :init
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
