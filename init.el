;;; -*- coding: utf-8; mode: emacs-lisp; -*-

(defun add-to-load-path (&rest paths)
  "Add paths to load-path recursively."
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "elisp")

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
