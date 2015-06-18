;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; general
(define-key global-map (kbd "C-h") 'backward-delete-char-untabify)
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)
(define-key global-map (kbd "C-x ?") 'help-command)
(define-key global-map (kbd "C-j") 'newline-and-indent)
(define-key global-map (kbd "C-m") 'newline)

;; buffer list
(define-key global-map (kbd "C-x C-b") 'bs-show)
(define-key global-map (kbd "M-n") 'bs-cycle-previous)
(define-key global-map (kbd "M-p") 'bs-cycle-next)
