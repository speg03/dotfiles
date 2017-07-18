(use-package mozc
  :bind (("<henkan>" . enable-input-method)
         ("<muhenkan>" . disable-input-method)
         :map mozc-mode-map
         ("<henkan>" . enable-input-method)
         ("<muhenkan>" . disable-input-method))
  :init
  (setq default-input-method "japanese-mozc")
  (setq mozc-candidate-style 'echo-area)

  (defun enable-input-method ()
    "Enable default-input-method."
    (interactive)
    (activate-input-method default-input-method))
  (defun disable-input-method ()
    "Disable input-method."
    (interactive)
    (deactivate-input-method)))

;; Key translation
(define-key key-translation-map (kbd "C-S-<iso-lefttab>") (kbd "C-S-<tab>"))

;; Font size
(setq default-face-attribute-height 130)
(set-face-attribute 'default nil
                    :height default-face-attribute-height)

;; Font
(add-to-list 'default-frame-alist '(font . "CicaE"))
