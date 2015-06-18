;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; not display startup-message
(setq-default inhibit-startup-message t)

;; color font
(global-font-lock-mode 1)

;; color selected region
(transient-mark-mode 1)

;; show pare brace
(show-paren-mode 1)

;; disable bar
(menu-bar-mode 0)
(when window-system
  (tool-bar-mode 0)
  (scroll-bar-mode 0))
