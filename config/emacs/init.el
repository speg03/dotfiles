;;; Auto generated files
(setq user-emacs-directory "~/.local/share/emacs/")
(setq custom-file (locate-user-emacs-file "custom.el"))
(setq cache-directory "~/.cache/emacs/")
(setq auto-save-list-file-prefix
      (concat cache-directory "auto-save-list/.saves-"))
(setq make-backup-files nil)

;;; Key bindings
(define-key key-translation-map (kbd "C-h") (kbd "DEL"))
(define-key key-translation-map (kbd "C-x j") (kbd "C-j"))
(define-key global-map (kbd "C-x ?") 'help-command)

;;; Misc
(setq inhibit-startup-message t)
(menu-bar-mode 0)

;;; Packaging
(when (version< emacs-version "26.3")
    (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

; use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(use-package use-package
  :init
  (setq use-package-always-ensure t))

; magit
(use-package magit
  :bind ("C-x g" . magit-status)
  :init
  (setq magit-auto-revert-mode nil)
  (setq magit-push-always-verify nil)
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))
