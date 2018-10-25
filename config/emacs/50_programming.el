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

(use-package elpy
  :after py-isort
  :bind (:map python-mode-map
              ("C-M-f" . python-reformat-buffer))
  :hook (elpy-mode . (lambda () (highlight-indentation-mode -1)))
  :init
  (defun python-reformat-buffer ()
    "Reformat python codes in the current buffer."
    (interactive)
    (py-isort-buffer)
    (elpy-format-code))

  (elpy-enable))

(use-package flycheck
  :hook ((python-mode sh-mode) . flycheck-mode))

(use-package go-mode)

(use-package markdown-mode
  :mode "\\.md\\'"
  :init
  (setq markdown-command "pandoc"))

(use-package matlab
  :ensure matlab-mode)

(use-package py-isort)

(use-package auto-virtualenvwrapper
  :hook (python-mode . auto-virtualenvwrapper-activate))

(use-package terraform-mode)

(use-package yaml-mode
  :mode ("\\.yml\\'" "\\.yaml\\'"))

(use-package web-mode
  :mode ("\\.js\\'" "\\.erb\\'" "\\.html?\\'")
  :init
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
