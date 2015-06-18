;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; encoding
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; avoid "Symbolic link to SVN-controlled source file; follow link? (yes or no)"
(setq vc-follow-symlinks t)

;; no backup files
(setq-default make-backup-files nil)
(setq-default auto-save-default nil)

;; not insert final newline
(setq-default mode-require-final-newline nil)

;; Don't use tabs for indentation as default
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; enable to delete region
(delete-selection-mode 1)

;; list-buffer to bs
(setq-default bs-configurations
      '(;; name
        ;; regex of display buffer
        ;; function of display buffer (display the buffer if this function return t)
        ;; regex of never display buffer
        ;; function of never display buffer (never display the buffer if this function return t)
        ;; sort function (args are B1 and B2)
        ("all" nil nil nil nil nil)
        ("files" nil nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))
(setq-default bs-default-configuration "files")

;; (yes or no) to (y or n)
(fset 'yes-or-no-p 'y-or-n-p)
