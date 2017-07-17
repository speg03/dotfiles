;; Encoding
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; Don't display startup-message
(setq inhibit-startup-message t)

;; Avoid "Symbolic link to SVN-controlled source file; follow link? (yes or no)"
(setq vc-follow-symlinks t)

;; No backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Make scripts executable
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; (yes or no) to (y or n)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Global keybind
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(define-key global-map (kbd "C-x ?") 'help-command)
(define-key global-map (kbd "C-j") 'newline-and-indent)
(define-key global-map (kbd "C-m") 'newline)

;; Yen-mark(165) to bask-slash(92)
(define-key global-map [165] [92])
