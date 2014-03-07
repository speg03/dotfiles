;;; not display startup-message
(setq inhibit-startup-message t)

;; avoid "Symbolic link to SVN-controlled source file; follow link? (yes or no)"
(setq vc-follow-symlinks t)

;;; color font
(global-font-lock-mode 1)

;;; color selected region
(transient-mark-mode 1)

;;; disable bar
(menu-bar-mode -1)

;;; no backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;;; not insert final newline
(setq mode-require-final-newline nil)

;;; show pare brace
(show-paren-mode 1)

;;; インデントにタブ文字を使用しない
(setq-default indent-tabs-mode nil)

;;; general key
(define-key global-map (kbd "C-h") 'backward-delete-char-untabify)
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)
(define-key global-map (kbd "C-x ?") 'help-command)

(define-key global-map (kbd "C-j") 'newline-and-indent)
(define-key global-map (kbd "C-m") 'newline)

;;; enable to delete region
(delete-selection-mode 1)

;;; list-buffer to bs
(define-key global-map (kbd "C-x C-b") 'bs-show)
(define-key global-map (kbd "M-n") 'bs-cycle-previous)
(define-key global-map (kbd "M-p") 'bs-cycle-next)
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

;;; (yes or no) to (y or n)
(fset 'yes-or-no-p 'y-or-n-p)

;;; Do not confirm server-kill-buffer
;;; (Do not work yet)
(when (server-running-p)
  (remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function))
