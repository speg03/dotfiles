(use-package bs
  :bind ("C-x C-b" . bs-show)
  :init
  (setq bs-default-configuration "files"))

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

  ;; Separator used between tabs
  (setq tabbar-separator '(0.5))

  ;; Override
  (defun tabbar-buffer-list ()
    (delq nil
          (mapcar #'(lambda (b)
                      (cond
                       ;; Always include the current buffer.
                       ((eq (current-buffer) b) b)
                       ((buffer-file-name b) b)
                       ((char-equal ?\  (aref (buffer-name b) 0)) nil)
                       ;; Exclude buffers that start with "*".
                       ((char-equal ?* (aref (buffer-name b) 0)) nil)
                       ((buffer-live-p b) b)))
                  (buffer-list))))

  ;; Override
  (defun tabbar-buffer-tab-label (tab)
    ;; Add padding
    (format "  %s  " (tabbar-tab-value tab)))

  (custom-set-faces
   '(tabbar-selected
     ((t (:inherit tabbar-default :foreground "dark slate gray" :background "light gray"))))
   '(tabbar-unselected ((t (:inherit tabbar-selected :inverse-video t))))
   '(tabbar-modified ((t (:inherit tabbar-unselected))))
   '(tabbar-selected-modified ((t (:inherit tabbar-selected))))))
