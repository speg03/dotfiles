;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; Configurations for Linux

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
