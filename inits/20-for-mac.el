;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; Configurations for Mac
(when (eq system-type 'darwin)
  ;; Remap Command to Meta
  (setq ns-command-modifier (quote meta))

  ;; ----------
  ;; for GUI
  (when window-system
    ;; Emacsclient for magit
    (setq-default magit-emacsclient-executable "/usr/local/bin/emacsclient")

    ;; Font (Source Han Code JP)
    (set-face-attribute 'default nil
                        :family "源ノ角ゴシック Code JP R"
                        :height 120)
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0208
                      (font-spec :family "源ノ角ゴシック Code JP R"))
    ) ; End (for GUI)
  ) ; End (Configurations for Mac)
