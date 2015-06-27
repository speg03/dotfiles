;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; Configurations for Mac
(when (eq system-type 'darwin)
  ;; Remap Command to Meta
  (setq ns-command-modifier (quote meta))

  ;; for GUI
  (when window-system
    ;; Font
    (set-face-attribute 'default nil
                        :family "源ノ角ゴシック Code JP R"
                        :height 120)
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0208
                      (font-spec :family "源ノ角ゴシック Code JP R"))
    ) ; End for GUI
  ) ; End for configurations
