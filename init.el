;;; -*- coding: utf-8; mode: emacs-lisp; -*-

(setq emacs-version-short
      (replace-regexp-in-string
       "\\([0-9]+\\)\\.\\([0-9]+\\).*" "\\1_\\2" emacs-version))
(setq custom-file
      (locate-user-emacs-file
       (concat "custom/custom_" emacs-version-short ".el")))

(defun install-package-if-not-exist (pkg)
  "Install the package if it does not exist."
  (unless (package-installed-p pkg)
    (message "INFO: Installing %s ..." pkg)
    (package-install pkg))
  (when (package-installed-p pkg)
    (message "INFO: Loaded %s." pkg)))

(when (file-exists-p (locate-user-emacs-file "proxy.el"))
  (load-file (locate-user-emacs-file "proxy.el")))

(when (require 'package nil t)
  (setq package-user-dir
        (locate-user-emacs-file "packages/"))
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize)
  (package-refresh-contents)

  (when (install-package-if-not-exist 'init-loader)
    (require 'init-loader)
    (init-loader-load (locate-user-emacs-file "inits/"))))
