;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; Configurations for Windows

;; File encoding
(set-file-name-coding-system 'cp932)

;; for GUI
(when window-system
  ;; Font size
  (setq default-face-attribute-height 110)

  ;; Font (Source Han Code JP)
  (set-face-attribute 'default nil
                      :family "源ノ角ゴシック Code JP R"
                      :height default-face-attribute-height)
  (set-fontset-font (frame-parameter nil 'font)
                    'japanese-jisx0208
                    (font-spec :family "源ノ角ゴシック Code JP R"))

  ;; Assign C-x C-c to suspend-frame instead of kill-emacs
  (define-key global-map (kbd "C-x C-c")
    '(lambda ()
       (interactive)
       (progn
         (kill-this-buffer)
         (suspend-frame))))
  ) ; End (for GUI)
