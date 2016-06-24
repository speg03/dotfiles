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

(when (file-exists-p "~/.emacs.d/proxy.el")
  (load-file "~/.emacs.d/proxy.el"))

(when (require 'package nil t)
  (setq package-user-dir "~/.emacs.d/packages/")
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize)
  (package-refresh-contents)

  (when (install-and-require 'init-loader)
    (init-loader-load "~/.emacs.d/inits/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zenburn-theme yaml-mode web-mode wc-mode undo-tree terraform-mode scala-mode2 markdown-mode magit init-loader helm go-mode git-gutter diminish auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
