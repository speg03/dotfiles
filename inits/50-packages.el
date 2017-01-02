;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; company
(when (install-package-if-not-exist 'company)
  (global-company-mode t)
  (global-set-key (kbd "M-/") 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-s") 'company-filter-candidates)
  (define-key company-active-map (kbd "C-i") 'company-complete-selection)
  (define-key company-active-map (kbd "M-h") 'company-show-doc-buffer)
  (define-key company-active-map (kbd "C-h") 'backward-delete-char-untabify))

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
  (eval-after-load 'undo-tree
    '(diminish 'undo-tree-mode)))

;; git-gutter
(when (install-package-if-not-exist 'git-gutter)
  (global-git-gutter-mode t)
  (git-gutter:linum-setup))

;; go-mode
(install-package-if-not-exist 'go-mode)

;; helm
(when (install-package-if-not-exist 'helm)
  (require 'helm)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (helm-mode 1))

;; magit
(when (install-package-if-not-exist 'magit)
  (setq magit-push-always-verify nil)
  (global-set-key (kbd "C-x g") 'magit-status))

;; markdown-mode
(when (install-package-if-not-exist 'markdown-mode)
  (require 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
  (define-key markdown-mode-map (kbd "M-n") nil)
  (define-key markdown-mode-map (kbd "M-p") nil)
  (setq markdown-command "pandoc"))

;; matlab-mode
(when (install-package-if-not-exist 'matlab-mode)
  (add-hook 'matlab-mode-hook
            (lambda ()
              (local-set-key (kbd "C-h") 'backward-delete-char-untabify))))

;; terraform-mode
(install-package-if-not-exist 'terraform-mode)

;; undo-tree
(when (install-package-if-not-exist 'undo-tree)
  (global-undo-tree-mode t))

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
