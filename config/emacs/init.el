;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;;; Minimum configurations

;; Encoding
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; Auto-generated files
(setq user-emacs-directory "~/.local/share/emacs/")
(setq custom-file (locate-user-emacs-file "custom.el"))
(setq cache-directory "~/.cache/emacs/")
(setq auto-save-list-file-prefix
      (concat cache-directory "auto-save-list/.saves-"))
(setq make-backup-files nil)

;; Global keybind
(define-key key-translation-map (kbd "C-h") (kbd "DEL"))
(define-key global-map (kbd "C-x ?") 'help-command)
(define-key global-map (kbd "C-m") 'newline)

;; Yen-mark(165) to bask-slash(92)
(define-key global-map [165] [92])


;;; Extra configurations

(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(unless package-archive-contents (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(use-package use-package
  :init
  (setq use-package-always-ensure t))

(use-package init-loader
  :init
  (setq init-loader-directory "~/.config/emacs/")
  :config
  (init-loader-load))
