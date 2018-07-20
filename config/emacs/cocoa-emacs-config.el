;; Remap Command to Meta
(setq ns-command-modifier (quote meta))

;; Font size
(setq default-face-attribute-height 190)
(set-face-attribute 'default nil
                    :height default-face-attribute-height)

;; Font
(add-to-list 'default-frame-alist '(font . "Cica"))
