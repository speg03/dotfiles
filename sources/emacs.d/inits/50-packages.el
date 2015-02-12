;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; auto-complete
(when (install-and-require 'auto-complete)
  (global-auto-complete-mode t))

;; diminish
(when (install-and-require 'diminish)
  (eval-after-load "auto-complete"
    '(diminish 'auto-complete-mode))
  (eval-after-load "git-gutter"
    '(diminish 'git-gutter-mode))
  (eval-after-load "undo-tree"
    '(diminish 'undo-tree-mode)))

;; git-commit-mode
(install-and-require 'git-commit-mode)

;; git-gutter
(when (install-and-require 'git-gutter)
  (global-git-gutter-mode t))

;; go-mode
(install-and-require 'go-mode)

;; helm
(when (install-and-require 'helm)
  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (helm-mode 1))

;; markdown-mode
(when (install-and-require 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
  (define-key markdown-mode-map (kbd "M-n") nil)
  (define-key markdown-mode-map (kbd "M-p") nil)
  (setq markdown-command "pandoc"))

;; undo-tree
(when (install-and-require 'undo-tree)
  (global-undo-tree-mode t))

;; yaml-mode
(when (install-and-require 'yaml-mode)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))

;; wc-mode
(install-and-require 'wc-mode)

;; web-mode
(when (install-and-require 'web-mode)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode)))