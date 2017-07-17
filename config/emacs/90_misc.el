;; Avoid "Symbolic link to SVN-controlled source file; follow link? (yes or no)"
(setq vc-follow-symlinks t)

;; (yes or no) to (y or n)
(defalias 'yes-or-no-p 'y-or-n-p)
