;; Ediff
(with-eval-after-load 'ediff
  ;; Open ediff control-panel in current frame
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  ;; Split window horizontally or vertically depending its width
  (add-hook 'ediff-before-setup-hook
            (lambda ()
              (setq ediff-split-window-function
                    (if (> (frame-width) 150)
                        'split-window-horizontally
                      'split-window-vertically)))))

;; wdired
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode))

;; git-gutter
(when (install-package-if-not-exist 'git-gutter)
  ;; git-gutter-fringe
  (when (install-package-if-not-exist 'git-gutter-fringe)
    (require 'git-gutter-fringe))
  (global-git-gutter-mode 1))

;; helm
(when (install-package-if-not-exist 'helm)
  (require 'helm-config)
  (helm-mode 1)
  (setq anything-enable-shortcuts 'prefix)
  (define-key global-map (kbd "M-x") 'helm-M-x)
  (define-key global-map (kbd "C-x C-f") 'helm-find-files)
  (define-key global-map (kbd "C-x b") 'helm-mini)

  ;; helm-git-grep
  (when (install-package-if-not-exist 'helm-git-grep)
    (global-set-key (kbd "C-c g") 'helm-git-grep)
    ;; Invoke `helm-git-grep' from isearch.
    (define-key isearch-mode-map (kbd "C-c g") 'helm-git-grep-from-isearch)
    ;; Invoke `helm-git-grep' from other helm.
    (eval-after-load 'helm
      '(define-key helm-map (kbd "C-c g") 'helm-git-grep-from-helm))))

;; magit
(when (install-package-if-not-exist 'magit)
  (setq magit-auto-revert-mode nil)
  (setq magit-push-always-verify nil)
  (define-key global-map (kbd "C-x g") 'magit-status))
