;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; Configurations for Mac

;; Remap Command to Meta
(setq ns-command-modifier (quote meta))

;; Font size
(setq default-face-attribute-height 150)
(set-face-attribute 'default nil
                    :height default-face-attribute-height)
