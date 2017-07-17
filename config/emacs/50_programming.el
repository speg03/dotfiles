;; Make scripts executable
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; company
(when (install-package-if-not-exist 'company)
  (global-company-mode 1)
  (define-key global-map (kbd "M-/") 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-s") 'company-filter-candidates)
  (define-key company-active-map (kbd "C-i") 'company-complete-selection)
  (define-key company-active-map (kbd "M-h") 'company-show-doc-buffer))

;; company-jedi
(when (install-package-if-not-exist 'company-jedi)
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t)
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-to-list 'company-backends 'company-jedi))

;; dockerfile-mode
(install-package-if-not-exist 'dockerfile-mode)

;; flycheck
(when (install-package-if-not-exist 'flycheck)
  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'sh-mode-hook 'flycheck-mode))

;; go-mode
(install-package-if-not-exist 'go-mode)

;; markdown-mode
(when (install-package-if-not-exist 'markdown-mode)
  (require 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
  (define-key markdown-mode-map (kbd "M-n") nil)
  (define-key markdown-mode-map (kbd "M-p") nil)
  (setq markdown-command "pandoc"))

;; matlab-mode
(install-package-if-not-exist 'matlab-mode)

;; py-isort, py-yapf
(when (and (install-package-if-not-exist 'py-isort)
           (install-package-if-not-exist 'py-yapf))
  (defun python-reformat-buffer ()
    "Reformat python codes in the current buffer."
    (interactive)
    (py-isort-buffer)
    (py-yapf-buffer))

  (add-hook 'python-mode-hook
            '(lambda ()
               (define-key python-mode-map (kbd "C-M-f") 'python-reformat-buffer))))

;; pyenv-mode
(when (install-package-if-not-exist 'pyenv-mode)
  (add-hook 'python-mode-hook 'pyenv-mode))

;; pyenv-mode-auto
(when (install-package-if-not-exist 'pyenv-mode-auto)
  (require 'pyenv-mode-auto))

;; terraform-mode
(install-package-if-not-exist 'terraform-mode)

;; yaml-mode
(when (install-package-if-not-exist 'yaml-mode)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))

;; web-mode
(when (install-package-if-not-exist 'web-mode)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode)))
