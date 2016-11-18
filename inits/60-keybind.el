;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; General
(define-key global-map (kbd "C-h") 'backward-delete-char-untabify)
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)
(define-key global-map (kbd "C-x ?") 'help-command)
(define-key global-map (kbd "C-j") 'newline-and-indent)
(define-key global-map (kbd "C-m") 'newline)

;; Buffer list
(define-key global-map (kbd "C-x C-b") 'bs-show)
(define-key global-map (kbd "M-n") 'bs-cycle-previous)
(define-key global-map (kbd "M-p") 'bs-cycle-next)

;; Font
(define-key global-map (kbd "C-+") 'increment-font-height)
(define-key global-map (kbd "C-=") 'decrement-font-height)
(define-key global-map (kbd "C-0") 'reset-font-height)
