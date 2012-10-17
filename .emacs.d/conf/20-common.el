;;; not display startup-message
(setq inhibit-startup-message t)

;; avoid "Symbolic link to SVN-controlled source file; follow link? (yes or no)"
(setq vc-follow-symlinks t)

;;; color font
(global-font-lock-mode t)

;;; color selected region
(setq transient-mark-mode t)

;;; disable bar
(menu-bar-mode nil)

;;; no backup files
(setq make-backup-files nil)

;;; not insert final newline
(setq mode-require-final-newline nil)

;;; show pare brace
(show-paren-mode t)

;;; general key
(global-set-key (kbd "C-h") 'backward-delete-char-untabify)
(global-set-key (kbd "C-x ?") 'help-command)

(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-j") 'newline)

;;; enable to delete region
(delete-selection-mode t)

;;; list-buffer to bs
(global-set-key (kbd "C-x C-b") 'bs-show)
(global-set-key (kbd "M-n") 'bs-cycle-previous)
(global-set-key (kbd "M-p") 'bs-cycle-next)
(setq bs-configurations
      '(;; name
        ;; regex of display buffer
        ;; function of display buffer (display the buffer if this function return t)
        ;; regex of never display buffer
        ;; function of never display buffer (never display the buffer if this function return t)
        ;; sort function (args are B1 and B2)
        ("all" nil nil nil nil nil)
	("files" nil nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)
	))
(setq bs-default-configuration "files")
