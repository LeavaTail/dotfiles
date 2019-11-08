;; メニューバーを消す
(menu-bar-mode 0)

;; ツールバーを非表示
(tool-bar-mode 0)

;; モードラインの行弁号,けた番号
(line-number-mode t)
(column-number-mode t)

;; 検索時に大文字小文字区別しない
(setq case-fold-search t)
;; インクリメンタルサーチの時に大文字小文字区別しない
(setq isearch-case-fold-search t)

;; バックアップファイルを作成しない
(setq backup-directory-alist '(".*" . "~/.emacs.d/backup"))
(setq version-control     t)
(setq kept-new-versions   5)
(setq kept-old-versions   1)
(setq delete-old-versions t)

(setq auto-save-file-name-transforms '(".*" . "~/.emacs.d/swap"))
;; 終了時にオートセーブファイとロックファイルを作成しない
(setq auto-save-file-prefix nil)
(setq create-lockfiles nil)

;; 現在の行を表示
(global-linum-mode t)

;; highlight
(global-hl-line-mode t)
(show-paren-mode t)
(setq show-paren-style `mixed)
(transient-mark-mode t)
