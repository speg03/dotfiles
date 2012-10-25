;;; -*- coding: utf-8; mode: elisp; -*-

;; howm-menuの言語を日本語に
(setq howm-menu-lang 'ja)

;; howm-modeを読み込む
(when (require 'howm-mode nil t)
  ;; C-c,,でhowm-menuを起動
  (define-key global-map (kbd "C-c ,,") 'howm-menu))
