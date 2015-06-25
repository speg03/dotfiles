;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; for Mac GUI
(when (eq window-system 'ns)
  ;; Remap Command to Meta
  (setq ns-command-modifier (quote meta))

  ;; Font
  (set-face-attribute 'default nil
                      :family "源ノ角ゴシック Code JP R"
                      :height 120)
  (set-fontset-font (frame-parameter nil 'font)
                    'japanese-jisx0208
                    (font-spec :family "源ノ角ゴシック Code JP M"))

  ;; Assign C-x C-c to suspend-frame instead of kill-emacs
  (define-key global-map (kbd "C-x C-c")
    '(lambda ()
       (interactive)
       (progn
         (kill-this-buffer)
         (suspend-frame))))

  ;; End
  )
