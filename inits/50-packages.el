;;; -*- coding: utf-8; mode: emacs-lisp; -*-

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
  (eval-after-load 'helm-mode
    '(diminish 'helm-mode))
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
  ;; git-gutter-fringe
  (when (install-package-if-not-exist 'git-gutter-fringe)
    (require 'git-gutter-fringe))
  (global-git-gutter-mode 1))

;; go-mode
(install-package-if-not-exist 'go-mode)

;; helm
(when (install-package-if-not-exist 'helm)
  (require 'helm-config)
  (helm-mode 1)
  (setq anything-enable-shortcuts 'prefix)
  (define-key global-map (kbd "M-x") 'helm-M-x)
  (define-key global-map (kbd "C-x C-f") 'helm-find-files)
  (define-key global-map (kbd "C-x b") 'helm-mini)

  ;; helm-git-grep
  (when (install-package-if-not-exist 'helm-git-grep)
    (global-set-key (kbd "C-c g") 'helm-git-grep)
    ;; Invoke `helm-git-grep' from isearch.
    (define-key isearch-mode-map (kbd "C-c g") 'helm-git-grep-from-isearch)
    ;; Invoke `helm-git-grep' from other helm.
    (eval-after-load 'helm
      '(define-key helm-map (kbd "C-c g") 'helm-git-grep-from-helm))))

;; magit
(when (install-package-if-not-exist 'magit)
  (setq magit-auto-revert-mode nil)
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

;; multiple-cursors
(when (install-package-if-not-exist 'multiple-cursors)
  (define-key global-map (kbd "C-M-l") 'mc/edit-lines)
  (define-key global-map (kbd "C-M-a") 'mc/mark-all-dwim))

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
