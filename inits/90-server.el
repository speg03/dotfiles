;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; Use Emacs as a server
(require 'server)

;; server-start for GUI
(when window-system
  (unless (eq (server-running-p) t)
    (server-start)))

;; Do not confirm server-kill-buffer
(when (server-running-p)
  (remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function))
