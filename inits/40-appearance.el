;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; Don't display startup-message
(setq-default inhibit-startup-message t)

;; Color
(global-font-lock-mode 1)

;; Color selected region
(transient-mark-mode 1)

;; Show a pair of braces
(show-paren-mode 1)

;; Disable bars
(menu-bar-mode 0)
(when window-system
  (tool-bar-mode 0)
  (scroll-bar-mode 0))
