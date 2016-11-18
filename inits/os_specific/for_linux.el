;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; Configurations for Linux

;; for GUI
(when window-system
  ;; Font size
  (setq default-face-attribute-height 100)
  (set-face-attribute 'default nil
                      :height default-face-attribute-height)

  ;; Font (Source Han Code JP)
  (set-fontset-font (frame-parameter nil 'font)
                    'japanese-jisx0208
                    (font-spec :family "VL Gothic"))
  ) ; End (for GUI)
