(use-package tabbar
  :bind (("C-<tab>" . tabbar-forward-tab)
         ("C-S-<tab>" . tabbar-backward-tab))
  :init
  (tabbar-mode 1)

  ;; Disable buffer groups
  (setq tabbar-buffer-groups-function nil)

  ;; Disable navigation buttons
  (setq tabbar-buffer-home-button '(("") ""))
  (setq tabbar-scroll-left-button '(("") ""))
  (setq tabbar-scroll-right-button '(("") ""))

  ;; Override
  (defun tabbar-buffer-list ()
    (delq nil
          (mapcar #'(lambda (b)
                      (cond
                       ;; Always include the current buffer.
                       ((eq (current-buffer) b) b)
                       ;; Include file buffers.
                       ((buffer-file-name b) b)))
                  (buffer-list))))

  ;; Override
  (defun tabbar-buffer-tab-label (tab)
    ;; Add padding
    (format "  %s  " (tabbar-tab-value tab)))

  (custom-set-faces
   '(tabbar-unselected
     ((t (:inherit tabbar-default :foreground "light gray" :background "dark slate gray"))))
   '(tabbar-selected ((t (:inherit tabbar-unselected :inverse-video t))))
   '(tabbar-modified ((t (:inherit tabbar-unselected :background "indian red"))))
   '(tabbar-selected-modified ((t (:inherit tabbar-selected))))))
