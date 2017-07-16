;; Mozc
(when (install-package-if-not-exist 'mozc)
  (require 'mozc)
  (setq default-input-method "japanese-mozc")
  (setq mozc-candidate-style 'echo-area)
  (define-key global-map (kbd "<henkan>") 'toggle-input-method)
  (define-key mozc-mode-map (kbd "<muhenkan>") 'toggle-input-method))

;; Font size
(setq default-face-attribute-height 130)
(set-face-attribute 'default nil
                    :height default-face-attribute-height)

;; Font
(add-to-list 'default-frame-alist '(font . "CicaE"))
