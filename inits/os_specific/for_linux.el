;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; Configurations for Linux

;; for GUI
(when window-system
  ;; Set PATH variable
  (when (install-package-if-not-exist 'exec-path-from-shell)
    (exec-path-from-shell-initialize))

  ;; Set PYENV_ROOT variable for pyenv
  (setenv "PYENV_ROOT"
          (concat (getenv "HOME") "/.anyenv/envs/pyenv"))

  ;; Mozc
  (when (install-package-if-not-exist 'mozc)
    (require 'mozc)
    (setq default-input-method "japanese-mozc")
    (global-set-key (kbd "<henkan>") 'toggle-input-method)
    (define-key mozc-mode-map (kbd "<muhenkan>") 'toggle-input-method))

  ;; Font size
  (setq default-face-attribute-height 110)
  (set-face-attribute 'default nil
                      :height default-face-attribute-height)

  ;; Font (Source Han Code JP)
  (set-fontset-font (frame-parameter nil 'font)
                    'japanese-jisx0208
                    (font-spec :family "VL Gothic"))
  ) ; End (for GUI)
