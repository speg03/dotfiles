;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; git-commit-mode
(install-and-require 'git-commit-mode)

;; markdown-mode
(when (install-and-require 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
  (define-key markdown-mode-map (kbd "M-n") nil)
  (define-key markdown-mode-map (kbd "M-p") nil)
  (setq markdown-command "pandoc"))

;; undo-tree
(when (install-and-require 'undo-tree)
  (global-undo-tree-mode))
