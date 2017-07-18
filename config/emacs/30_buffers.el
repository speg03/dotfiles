(use-package bs
  :bind (("C-x C-b" . bs-show)
         ("C-<tab>" . bs-cycle-previous)
         ("C-S-<tab>" . bs-cycle-next))
  :init
  (setq bs-default-configuration "files-and-scratch"))
