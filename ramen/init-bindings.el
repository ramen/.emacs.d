(require 'misc)

(global-set-key (kbd "<C-S-down>") 'scroll-up-1)
(global-set-key (kbd "<C-S-up>") 'scroll-down-1)

(global-set-key (kbd "<C-S-iso-lefttab>") 'previous-multiframe-window)
(global-set-key (kbd "<C-tab>") 'next-multiframe-window)

(global-set-key (kbd "<M-left>") 'dedent-current-region)
(global-set-key (kbd "<M-right>") 'indent-current-region)
(global-set-key (kbd "<M-up>") 'enlarge-window)
(global-set-key (kbd "<M-down>") 'shrink-window)

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

(global-set-key (kbd "C-M-SPC") 'mark-line)
(global-set-key (kbd "C-M-k") 'kill-whole-line)

(global-set-key (kbd "C-\\") 'delete-whitespace-forward)

(global-set-key (kbd "M-#") 'comment-line)
(global-set-key (kbd "M-)") 'close-open-paren)
(global-set-key (kbd "M-+") 'duplicate-line)
(global-set-key (kbd "M-]") 'insert-curlies)
(global-set-key (kbd "M-_") 'goto-last-change)
(global-set-key (kbd "M-z") 'zap-up-to-char)

(global-set-key (kbd "RET") 'newline-and-indent)
