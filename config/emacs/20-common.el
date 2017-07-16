;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; Encoding
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; Enable to delete region
(delete-selection-mode 1)

;; Revert file automatically if changed
(global-auto-revert-mode 1)

;; (yes or no) to (y or n)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Avoid "Symbolic link to SVN-controlled source file; follow link? (yes or no)"
(setq-default vc-follow-symlinks t)

;; No backup files
(setq-default make-backup-files nil)
(setq-default auto-save-default nil)

;; Don't insert final newline
(setq-default mode-require-final-newline nil)

;; Don't use tabs for indentation as default
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Buffer list
(setq-default bs-default-configuration "files-and-scratch")

;; Make scripts executable
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)
