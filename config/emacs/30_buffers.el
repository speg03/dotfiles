(use-package bs
  :bind (("C-x C-b" . bs-show)
         ("M-n" . bs-cycle-previous)
         ("M-p" . bs-cycle-next))
  :config
  (setq bs-default-configuration "files-and-scratch"))
