(use-package ediff
  :config
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
         ("C-x b" . helm-mini))
  :config
  (require 'helm-config)
  (helm-mode 1)
  (setq anything-enable-shortcuts 'prefix))

(use-package helm-git-grep
  :after helm
  :bind (("C-c g" . helm-git-grep)
         :map isearch-mode-map
         ("C-c g" . helm-git-grep-from-isearch)
         :map helm-map
         ("C-c g" . helm-git-grep-from-helm)))

(use-package magit
  :bind ("C-x g" . magit-status)
  :config
  (setq magit-auto-revert-mode nil)
  (setq magit-push-always-verify nil))
