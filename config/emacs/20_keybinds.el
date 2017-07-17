;; Global keybind
(define-key key-translation-map (kbd "C-h") (kbd "DEL"))
(define-key global-map (kbd "C-x ?") 'help-command)
(define-key global-map (kbd "C-m") 'newline)

;; Yen-mark(165) to bask-slash(92)
(define-key global-map [165] [92])
