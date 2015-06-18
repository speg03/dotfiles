(require 'server)

;;; Do not confirm server-kill-buffer
(when (server-running-p)
  (remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function))
