(use-package ediff
  ;; Split window horizontally or vertically depending its width
  :hook (ediff-before-setup
         . (lambda ()
             (setq ediff-split-window-function
                   (if (> (frame-width) 150)
                       'split-window-horizontally
                     'split-window-vertically))))
  :init
  ;; Open ediff control-panel in current frame
  (setq ediff-window-setup-function 'ediff-setup-windows-plain))

(use-package dired
  :ensure nil
  :bind (:map dired-mode-map
              ("r" . wdired-change-to-wdired-mode)))

(use-package git-gutter
  :diminish
  :config
  (global-git-gutter-mode 1))

(use-package google-translate
  :bind (("C-c t" . google-translate-smooth-translate))
  :init
  (require 'google-translate-smooth-ui)
  (setq google-translate-translation-directions-alist
        '(("en" . "ja") ("ja" . "en"))))

(use-package helm
  :diminish
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

(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (push "~/.config/emacs/snippets" yas-snippet-dirs)
  (yas-global-mode 1))
