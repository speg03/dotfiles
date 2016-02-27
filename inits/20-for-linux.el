;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; Configurations for Linux
(when (eq system-type 'gnu/linux)
  ;; ----------
  ;; for GUI
  (when window-system
    ;; Font (Source Han Code JP)
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0208
                      (font-spec :family "VL Gothic"))
    ) ; End (for GUI)
  ) ; End (Configurations for Mac)
