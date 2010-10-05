;;; init-bindings.el --- Custom key bindings

(require 'misc) ; for zap-up-to-char

;; Scrolling without moving the point
(global-set-key (kbd "<C-S-down>") 'scroll-up-1)
(global-set-key (kbd "<C-S-up>") 'scroll-down-1)

;; Cycling through windows and frames
(global-set-key (kbd "<C-S-iso-lefttab>") 'previous-multiframe-window)
(global-set-key (kbd "<C-tab>") 'next-multiframe-window)

;; Indentation
(global-set-key (kbd "<M-left>") 'dedent-current-region)
(global-set-key (kbd "<M-right>") 'indent-current-region)

;; Window size
(global-set-key (kbd "<M-up>") 'enlarge-window)
(global-set-key (kbd "<M-down>") 'shrink-window)

;; Function keys
(global-set-key (kbd "<M-f2>") 'align-regexp)
(global-set-key (kbd "<f3>") 'query-replace)
(global-set-key (kbd "<M-f3>") 'query-replace-regexp)
(global-set-key (kbd "<f4>") 'svn-status)
(global-set-key (kbd "<f5>") 'recompile)
(global-set-key (kbd "<M-f5>") 'compile)
(global-set-key (kbd "<f6>") 'other-window)
(global-set-key (kbd "<M-f6>") 'rotate-windows)
(global-set-key (kbd "<f7>") 'toggle-truncate-lines)
(global-set-key (kbd "<M-f7>") 'toggle-show-trailing-whitespace)
(global-set-key (kbd "<f8>") 'follow-delete-other-windows-and-split)
(global-set-key (kbd "<M-f8>") 'follow-mode-quit)
(global-set-key (kbd "<f9>") 'open-shell-pane)
(global-set-key (kbd "<M-f9>") 'linum-mode)
(global-set-key (kbd "<f11>") 'bookmark-jump)
(global-set-key (kbd "<M-f11>") 'bookmark-set)
(global-set-key (kbd "<f12>") 'call-last-kbd-macro)
(global-set-key (kbd "<M-f12>") 'start-or-end-kbd-macro)

;; Easier bindings for winner-mode
(global-set-key (kbd "C-c <C-left>") 'winner-undo)
(global-set-key (kbd "C-c <C-right>") 'winner-redo)

;; Line-oriented commands
(global-set-key (kbd "C-M-SPC") 'mark-line)
(global-set-key (kbd "C-M-k") 'kill-whole-line)
(global-set-key (kbd "M-#") 'comment-line)
(global-set-key (kbd "M-+") 'duplicate-line)
(global-set-key (kbd "M-`") 'next-error)

;; Other useful commands
(global-set-key (kbd "C-M-n") 'move-region-down)
(global-set-key (kbd "C-M-p") 'move-region-up)
(global-set-key (kbd "C-\\") 'delete-whitespace-forward)
(global-set-key (kbd "M-)") 'close-open-paren)
(global-set-key (kbd "M-]") 'insert-curlies)
(global-set-key (kbd "M-_") 'goto-last-change)
(global-set-key (kbd "M-q") 'fill-individual-paragraphs)
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Revert swapped bindings from emacs-starter-kit
(global-set-key (kbd "C-M-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward)
(global-set-key (kbd "C-s") 'isearch-forward)
