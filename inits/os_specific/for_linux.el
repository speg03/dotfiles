;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; Configurations for Linux

;; Mozc
(when (install-package-if-not-exist 'mozc)
  (require 'mozc)
  (setq default-input-method "japanese-mozc")
  (define-key global-map (kbd "<henkan>") 'toggle-input-method)
  (define-key mozc-mode-map (kbd "<muhenkan>") 'toggle-input-method))

;; Font size
(setq default-face-attribute-height 110)
(set-face-attribute 'default nil
                    :height default-face-attribute-height)
