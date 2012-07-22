;;; -*- coding: utf-8; mode: emacs-lisp; -*-

;;; Emacs実践入門より

;; Emacs 23より前のバージョンを利用している場合は
;; user-emacs-directory変数を定義
(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d"))

;; load-pathを追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
(add-to-load-path "elisp" "conf" "public_repos")

;; auto-installの設定
(when (require 'auto-install nil t)
  ;; インストールディレクトリ
  (setq auto-install-directory "~/.emacs.d/elisp/")
  ;; EmacsWikiに登録されているelispの名前を取得する
  (auto-install-update-emacswiki-package-name t)
  ;; install-elispの関数を利用可能にする
  (auto-install-compatibility-setup))

;; init-loaderの設定
(when (require 'init-loader nil t)
  ;; 設定ファイルのディレクトリを指定
  (init-loader-load "~/.emacs.d/conf/"))