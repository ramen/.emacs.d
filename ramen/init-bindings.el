(require 'misc)

(global-set-key (kbd "<C-S-down>") 'scroll-up-1)
(global-set-key (kbd "<C-S-up>") 'scroll-down-1)

(global-set-key (kbd "<C-S-iso-lefttab>") 'previous-multiframe-window)
(global-set-key (kbd "<C-tab>") 'next-multiframe-window)

(global-set-key (kbd "<M-left>") 'dedent-current-region)
(global-set-key (kbd "<M-right>") 'indent-current-region)
(global-set-key (kbd "<M-up>") 'enlarge-window)
(global-set-key (kbd "<M-down>") 'shrink-window)

(global-set-key (kbd "<f9>") 'open-shell-pane)

(global-set-key (kbd "C-M-SPC") 'mark-line)
(global-set-key (kbd "C-M-k") 'kill-whole-line)

(global-set-key (kbd "M-#") 'comment-line)
(global-set-key (kbd "M-)") 'close-open-paren)
(global-set-key (kbd "M-+") 'duplicate-line)
(global-set-key (kbd "M-]") 'insert-curlies)
(global-set-key (kbd "M-_") 'goto-last-change)
(global-set-key (kbd "M-z") 'zap-up-to-char)

(global-set-key (kbd "RET") 'newline-and-indent)
