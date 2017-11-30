(use-package ediff
  :init
  ;; Open ediff control-panel in current frame
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  ;; Split window horizontally or vertically depending its width
  (add-hook 'ediff-before-setup-hook
            (lambda ()
              (setq ediff-split-window-function
                    (if (> (frame-width) 150)
                        'split-window-horizontally
                      'split-window-vertically)))))

(use-package dired
  :ensure nil
  :bind (:map dired-mode-map
              ("r" . wdired-change-to-wdired-mode)))

(use-package git-gutter
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode 1))

(use-package git-gutter-fringe
  :after git-gutter)

(use-package helm
  :diminish helm-mode
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)
         :map helm-map
         ("C-i" . helm-execute-persistent-action)
         ("C-z" . helm-select-action))
  :init
  (require 'helm-config)
  (helm-mode 1)
  (setq anything-enable-shortcuts 'prefix))

(use-package helm-c-yasnippet
  :after (helm yasnippet)
  :bind (("C-c y" . helm-yas-complete)))

(use-package helm-git-grep
  :after helm
  :bind (("C-c g" . helm-git-grep)
         :map isearch-mode-map
         ("C-c g" . helm-git-grep-from-isearch)
         :map helm-map
         ("C-c g" . helm-git-grep-from-helm)))

(use-package magit
  :bind ("C-x g" . magit-status)
  :init
  (setq magit-auto-revert-mode nil)
  (setq magit-push-always-verify nil))

(use-package neotree
  :bind (("C-c o" . neotree-toggle)
         :map neotree-mode-map
         ("e" . neotree-enter-hide))
  :init
  (setq neo-show-hidden-files t)
  (setq neo-create-file-auto-open t)
  (setq neo-keymap-style 'concise)
  (setq neo-smart-open t)
  (setq neo-vc-integration '(face))

  (defun neo-open-file-hide (full-path &optional arg)
    "Open a file node and hides tree."
    (neo-global--select-mru-window arg)
    (find-file full-path)
    (neotree-hide))

  (defun neotree-enter-hide (&optional arg)
    "Enters file and hides neotree directly"
    (interactive "P")
    (neo-buffer--execute arg 'neo-open-file-hide 'neo-open-dir)))

(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (push "~/.config/emacs/snippets" yas-snippet-dirs)
  (yas-global-mode 1))
