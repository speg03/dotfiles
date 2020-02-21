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
  :config
  (push 'er/mark-outside-pairs er/try-expand-list))

(use-package phi-search)

(use-package multiple-cursors
  :after expand-region
  :bind (("C-x r t" . mc/edit-lines-or-string-rectangle)
         ("C-M-SPC" . mc/mark-all-dwim-or-mark-sexp)
         ("C-," . mc/mark-previous-like-this)
         ("C-." . mc/mark-next-like-this)
         ("C-<" . mc/skip-to-previous-like-this)
         ("C->" . mc/skip-to-next-like-this))
  :init
  (setq mc/list-file "~/.config/emacs/mc-lists.el")
  :config
  ;; ref: http://emacs.rubikitch.com/multiple-cursors/
  (defun mc/edit-lines-or-string-rectangle (s e)
    "C-x r tで同じ桁の場合にmc/edit-lines"
    (interactive "r")
    (if (eq (save-excursion (goto-char s) (current-column))
            (save-excursion (goto-char e) (current-column)))
        (call-interactively 'mc/edit-lines)
      (call-interactively 'string-rectangle)))

  (defun mc/mark-all-dwim-or-mark-sexp (arg)
    "C-u C-M-SPCでmc/mark-all-dwim"
    (interactive "p")
    (cl-case arg
      (4 (mc/mark-all-dwim nil))
      (1 (er/expand-region 1)))))

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
  :diminish
  :config
  (global-undo-tree-mode 1))

(use-package wc-mode)
