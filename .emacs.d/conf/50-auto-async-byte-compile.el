;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; M-x install-elisp-from-emacswiki auto-async-byte-compile.el
;; http://d.hatena.ne.jp/rubikitch/20100423/bytecomp

(when (require 'auto-async-byte-compile nil t)
  (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
  (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode))
