;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; Don't display startup-message
(setq-default inhibit-startup-message t)

;; Color
(global-font-lock-mode 1)

;; Color selected region
(transient-mark-mode 1)

;; Show a pair of braces
(show-paren-mode 1)

;; Disable menu bar
(menu-bar-mode 0)

;; Disable tool bar
(tool-bar-mode 0)

;; Line number
(global-linum-mode 1)

;; Transparent frame
(set-frame-parameter nil 'alpha '(95 . 70))

;; Ediff
; Open ediff control-panel in current frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
; Split window horizontally or vertically depending its width
(add-hook 'ediff-before-setup-hook
          (lambda ()
            (setq ediff-split-window-function
                  (if (> (frame-width) 150)
                      'split-window-horizontally
                    'split-window-vertically))))

;; zenburn-theme
(when (install-package-if-not-exist 'zenburn-theme)
  (load-theme 'zenburn t))

;; Font size
(defun increment-font-height ()
  "Increment height of face attributes"
  (interactive)
  (set-face-attribute 'default nil
                      :height (+ (face-attribute 'default :height) 20)))

(defun decrement-font-height ()
  "Decrement height of face attributes"
  (interactive)
  (set-face-attribute 'default nil
                      :height (- (face-attribute 'default :height) 20)))

(defun reset-font-height ()
  "Reset height of face attributes"
  (interactive)
  (set-face-attribute 'default nil
                      :height default-face-attribute-height))
