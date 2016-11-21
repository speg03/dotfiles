;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; Configurations for Mac

;; Remap Command to Meta
(setq ns-command-modifier (quote meta))

;; for GUI
(when window-system
  ;; Set PATH variable
  (when (install-package-if-not-exist 'exec-path-from-shell)
    (exec-path-from-shell-initialize))

  ;; Set PYENV_ROOT variable for pyenv
  (setenv "PYENV_ROOT"
          (concat (getenv "HOME") "/.anyenv/envs/pyenv"))

  ;; Font size
  (setq default-face-attribute-height 160)
  (set-face-attribute 'default nil
                      :height default-face-attribute-height)
  ) ; End (for GUI)
