;;; -*- coding: utf-8; mode: emacs-lisp; -*-

(when (require 'markdown-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
  (setq markdown-command "pandoc"))
