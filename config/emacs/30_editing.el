;; Enable to delete region
(delete-selection-mode 1)

;; Revert file automatically if changed
(global-auto-revert-mode 1)
(diminish 'auto-revert-mode)

;; Don't use tabs for indentation as default
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Don't insert final newline
(setq mode-require-final-newline nil)

(use-package expand-region
  :bind ("C-M-SPC" . er/expand-region)
  :config
  (push 'er/mark-outside-pairs er/try-expand-list))

(use-package multiple-cursors
  :bind (("C-M-l" . mc/edit-lines)
         ("C-M-a" . mc/mark-all-dwim)))

(use-package recentf
  :ensure nil
  :init
  (setq recentf-save-file
        (concat cache-directory "recentf"))
  (setq recentf-max-saved-items 2000)
  (run-with-idle-timer 300 t 'recentf-save-list)
  :config
  (recentf-mode 1))

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode 1))

(use-package wc-mode)