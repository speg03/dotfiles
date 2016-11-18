;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; OS specific Configurations

;; for Mac
(when (eq system-type 'darwin)
  (load-file
   (concat init-loader-directory "/os_specific/for_mac.el")))

;; for Linux
(when (eq system-type 'gnu/linux)
  (load-file
   (concat init-loader-directory "/os_specific/for_linux.el")))

;; for Windows
(when (eq system-type 'windows-nt)
  (load-file
   (concat init-loader-directory "/os_specific/for_windows.el")))
