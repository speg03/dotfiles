;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; anything
(when (install-package-if-not-exist 'anything)
  ;; http://emacs.rubikitch.com/anything/
  (require 'anything-config)
  (setq anything-enable-shortcuts 'prefix)
  (define-key anything-map (kbd "@") 'anything-select-with-prefix-shortcut)
  (define-key global-map (kbd "M-x") 'anything-M-x)
  (define-key global-map (kbd "C-x C-f") 'anything-find-files)
  (define-key global-map (kbd "C-x b") 'anything-mini))

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

;; diminish
(when (install-package-if-not-exist 'diminish)
  (eval-after-load 'company
    '(diminish 'company-mode))
  (eval-after-load 'git-gutter
    '(diminish 'git-gutter-mode))
  (eval-after-load 'magit
    '(diminish 'auto-revert-mode))
  (eval-after-load 'undo-tree
    '(diminish 'undo-tree-mode)))

;; expand-region
(when (install-package-if-not-exist 'expand-region)
  ;; http://emacs.rubikitch.com/expand-region/
  (require 'expand-region)
  (push 'er/mark-outside-pairs er/try-expand-list)
  (define-key global-map (kbd "C-M-SPC") 'er/expand-region))

;; flycheck
(when (install-package-if-not-exist 'flycheck)
  (when (install-package-if-not-exist 'flycheck-pyflakes)
    (require 'flycheck-pyflakes))
  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'sh-mode-hook 'flycheck-mode))

;; git-gutter
(when (install-package-if-not-exist 'git-gutter)
  (global-git-gutter-mode 1)
  (git-gutter:linum-setup))

;; go-mode
(install-package-if-not-exist 'go-mode)

;; magit
(when (install-package-if-not-exist 'magit)
  (setq magit-push-always-verify nil)
  (define-key global-map (kbd "C-x g") 'magit-status))

;; markdown-mode
(when (install-package-if-not-exist 'markdown-mode)
  (require 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
  (define-key markdown-mode-map (kbd "M-n") nil)
  (define-key markdown-mode-map (kbd "M-p") nil)
  (setq markdown-command "pandoc"))

;; matlab-mode
(install-package-if-not-exist 'matlab-mode)

;; py-yapf
(when (install-package-if-not-exist 'py-yapf)
  (add-hook 'python-mode-hook 'py-yapf-enable-on-save))

;; pyenv-mode
(when (install-package-if-not-exist 'pyenv-mode)
  (add-hook 'python-mode-hook 'pyenv-mode))

;; pyenv-mode-auto
(when (install-package-if-not-exist 'pyenv-mode-auto)
  (require 'pyenv-mode-auto))

;; terraform-mode
(install-package-if-not-exist 'terraform-mode)

;; undo-tree
(when (install-package-if-not-exist 'undo-tree)
  (global-undo-tree-mode 1))

;; yaml-mode
(when (install-package-if-not-exist 'yaml-mode)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))

;; wc-mode
(install-package-if-not-exist 'wc-mode)

;; web-mode
(when (install-package-if-not-exist 'web-mode)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode)))
