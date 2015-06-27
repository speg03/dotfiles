;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; Configurations for Windows
(when (eq system-type 'windows-nt)
  (set-file-name-coding-system 'cp932)

  ;; for GUI
  (when window-system
    ;; Font
    (set-face-attribute 'default nil
                        :family "源ノ角ゴシック Code JP R"
                        :height 110)
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
    ) ; End for GUI
  ) ; End for configurations
