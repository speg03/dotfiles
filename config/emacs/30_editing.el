;; Enable to delete region
(delete-selection-mode 1)

;; Revert file automatically if changed
(global-auto-revert-mode 1)

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

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode 1))

(use-package wc-mode)
