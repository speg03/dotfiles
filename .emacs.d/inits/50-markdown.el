;;; -*- coding: utf-8; mode: emacs-lisp; -*-

(when (install-and-require 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
  (define-key markdown-mode-map (kbd "M-n") nil)
  (define-key markdown-mode-map (kbd "M-p") nil)
  (setq markdown-command "pandoc"))
