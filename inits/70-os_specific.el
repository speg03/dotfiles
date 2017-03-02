;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; OS specific Configurations

(setq os-type-name
      (replace-regexp-in-string "/" "-" (symbol-name system-type)))
(setq os-specific-file
      (concat init-loader-directory "/os_specific/" os-type-name ".el"))

(when (file-exists-p os-specific-file)
  (load-file os-specific-file))
