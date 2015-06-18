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

(defun install-and-require (pkg)
  "Install and require the package."
  (unless (require pkg nil t)
    (message "INFO: Installing %s ..." pkg)
    (package-install pkg))
  (when (require pkg nil t)
    (message "INFO: Loaded %s." pkg)))

(when (require 'package nil t)
  (setq package-user-dir "~/.emacs.d/packages/")
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize)
  (package-refresh-contents)

  (when (install-and-require 'init-loader)
    (init-loader-load "~/.emacs.d/inits/")))
