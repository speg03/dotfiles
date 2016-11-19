;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;; auto-complete
(when (install-package-if-not-exist 'auto-complete)
  (require 'auto-complete-config)
  (ac-config-default)
  (global-auto-complete-mode t))

;; diminish
(when (install-package-if-not-exist 'diminish)
  (eval-after-load "auto-complete"
    '(diminish 'auto-complete-mode))
  (eval-after-load "git-gutter"
    '(diminish 'git-gutter-mode))
  (eval-after-load "undo-tree"
    '(diminish 'undo-tree-mode)))

;; git-gutter
(when (install-package-if-not-exist 'git-gutter)
  (global-git-gutter-mode t))

;; go-mode
(install-package-if-not-exist 'go-mode)

;; helm
(when (install-package-if-not-exist 'helm)
  (require 'helm)
  (global-set-key (kbd "M-x") 'undefined)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (helm-mode 1))

;; jedi
(when (install-package-if-not-exist 'jedi)
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t))

;; magit
(when (install-package-if-not-exist 'magit)
  (setq magit-auto-revert-mode nil)
  (setq magit-push-always-verify nil)
  (setq magit-last-seen-setup-instructions "1.4.0")
  (global-set-key (kbd "C-x g") 'magit-status))

;; markdown-mode
(when (install-package-if-not-exist 'markdown-mode)
  (require 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
  (define-key markdown-mode-map (kbd "M-n") nil)
  (define-key markdown-mode-map (kbd "M-p") nil)
  (setq markdown-command "pandoc"))

;; matlab-mode
(when (install-package-if-not-exist 'matlab-mode)
  (add-hook 'matlab-mode-hook
            (lambda ()
              (local-set-key (kbd "C-h") 'backward-delete-char-untabify))))

;; terraform-mode
(install-package-if-not-exist 'terraform-mode)

;; undo-tree
(when (install-package-if-not-exist 'undo-tree)
  (global-undo-tree-mode t))

;; yaml-mode
(when (install-package-if-not-exist 'yaml-mode)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))

;; wc-mode
(install-package-if-not-exist 'wc-mode)

;; web-mode
(when (install-package-if-not-exist 'web-mode)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode)))
