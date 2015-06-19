;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; for Windows GUI
(when (eq window-system 'w32)
  (set-file-name-coding-system 'cp932)

  ;; Assign C-x C-c to suspend-frame instead of kill-emacs
  (define-key global-map (kbd "C-x C-c")
    '(lambda ()
       (interactive)
       (progn
         (kill-this-buffer)
         (suspend-frame)))))
