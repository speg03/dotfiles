;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; General
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(define-key global-map (kbd "C-x ?") 'help-command)
(define-key global-map (kbd "C-j") 'newline-and-indent)
(define-key global-map (kbd "C-m") 'newline)

;; Buffer list
(define-key global-map (kbd "C-x C-b") 'bs-show)
(define-key global-map (kbd "M-n") 'bs-cycle-previous)
(define-key global-map (kbd "M-p") 'bs-cycle-next)

;; Font
(define-key global-map (kbd "C-+") 'increment-font-height)
(define-key global-map (kbd "C--") 'decrement-font-height)
(define-key global-map (kbd "C-0") 'reset-font-height)

;; Yen-mark(165) to bask-slash(92)
(define-key global-map [165] [92])
