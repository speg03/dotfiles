;;; -*- coding: utf-8; mode: emacs-lisp; -*-

(setq emacs-version-short (replace-regexp-in-string
                           "\\([0-9]+\\)\\.\\([0-9]+\\).*"
                           "\\1_\\2" emacs-version))
(setq custom-file (expand-file-name
                   (concat "custom/custom_" emacs-version-short ".el")
                   user-emacs-directory))

(defun install-package-if-not-exist (pkg)
  "Install the package if it does not exist."
  (unless (package-installed-p pkg)
    (message "INFO: Installing %s ..." pkg)
    (package-install pkg))
  (when (package-installed-p pkg)
    (message "INFO: Loaded %s." pkg)))

(when (file-exists-p "~/.emacs.d/proxy.el")
  (load-file "~/.emacs.d/proxy.el"))

(when (require 'package nil t)
  (setq package-user-dir "~/.emacs.d/packages/")
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize)
  (package-refresh-contents)

  (when (install-package-if-not-exist 'init-loader)
    (require 'init-loader)
    (init-loader-load "~/.emacs.d/inits/")))
