;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; Configurations for Mac
(when (eq system-type 'darwin)
  ;; Remap Command to Meta
  (setq ns-command-modifier (quote meta))

  ;; ----------
  ;; for GUI
  (when window-system
    ;; Set PATH variable for emacsclient used by magit
    (when (install-and-require 'exec-path-from-shell)
      (exec-path-from-shell-initialize))

    ;; Font size
    (set-face-attribute 'default nil :height 140)
    ) ; End (for GUI)
  ) ; End (Configurations for Mac)
