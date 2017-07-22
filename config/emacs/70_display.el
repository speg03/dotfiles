;; Color
(global-font-lock-mode 1)

;; Color selected region
(transient-mark-mode 1)

;; Show a pair of braces
(show-paren-mode 1)

;; Disable menu bar
(menu-bar-mode 0)

;; Disable tool bar
(tool-bar-mode 0)

;; Disable scroll bar
(scroll-bar-mode 0)

;; Line and column  number
(global-linum-mode 1)
(column-number-mode 1)

;; Default frame configuration
(add-to-list 'default-frame-alist '(width  . 100))
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(alpha  . (95 . 70)))

(use-package monokai-theme
  :config
  (load-theme 'monokai t))

;; Font size
(defun increment-font-height ()
  "Increment height of face attributes"
  (interactive)
  (set-face-attribute 'default nil
                      :height (+ (face-attribute 'default :height) 20)))

(defun decrement-font-height ()
  "Decrement height of face attributes"
  (interactive)
  (set-face-attribute 'default nil
                      :height (- (face-attribute 'default :height) 20)))

(defun reset-font-height ()
  "Reset height of face attributes"
  (interactive)
  (set-face-attribute 'default nil
                      :height default-face-attribute-height))

(define-key global-map (kbd "C-+") 'increment-font-height)
(define-key global-map (kbd "C--") 'decrement-font-height)
(define-key global-map (kbd "C-0") 'reset-font-height)
