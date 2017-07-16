;; Enable to delete region
(delete-selection-mode 1)

;; Revert file automatically if changed
(global-auto-revert-mode 1)

;; Don't use tabs for indentation as default
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Don't insert final newline
(setq-default mode-require-final-newline nil)

;; expand-region
(when (install-package-if-not-exist 'expand-region)
  ;; http://emacs.rubikitch.com/expand-region/
  (require 'expand-region)
  (push 'er/mark-outside-pairs er/try-expand-list)
  (define-key global-map (kbd "C-M-SPC") 'er/expand-region))

;; multiple-cursors
(when (install-package-if-not-exist 'multiple-cursors)
  (define-key global-map (kbd "C-M-l") 'mc/edit-lines)
  (define-key global-map (kbd "C-M-a") 'mc/mark-all-dwim))

;; undo-tree
(when (install-package-if-not-exist 'undo-tree)
  (global-undo-tree-mode 1))

;; wc-mode
(install-package-if-not-exist 'wc-mode)
