;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; for Windows GUI
(when (eq window-system 'w32)
  (set-file-name-coding-system 'cp932)

  ;; Font
  (set-face-attribute 'default nil
                      :family "源ノ角ゴシック Code JP R"
                      :height 110)
  (set-fontset-font (frame-parameter nil 'font)
                    'japanese-jisx0208
                    (font-spec :family "源ノ角ゴシック Code JP M"))

  ;; End
  )
