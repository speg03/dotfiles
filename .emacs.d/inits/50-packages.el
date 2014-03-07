;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; auto-complete
(when (install-and-require 'auto-complete)
  (global-auto-complete-mode t))

;; diminish
(when (install-and-require 'diminish)
  (eval-after-load "auto-complete"
    '(diminish 'auto-complete-mode))
  (eval-after-load "git-gutter+"
    '(diminish 'git-gutter+-mode))
  (eval-after-load "undo-tree"
    '(diminish 'undo-tree-mode)))

;; git-commit-mode
(install-and-require 'git-commit-mode)

;; git-gutter+
(when (install-and-require 'git-gutter+)
  (global-git-gutter+-mode t))

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
