(require 'server)

(when (eq window-system 'w32)
  (unless (server-running-p)
    (server-start)))

;;; Do not confirm server-kill-buffer
(when (server-running-p)
  (remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function))
