;;; init-bindings.el --- Custom key bindings

(require 'misc) ; for zap-up-to-char

;; Scrolling without moving the point
(global-set-key (kbd "<C-S-down>") 'scroll-up-1)
(global-set-key (kbd "<C-S-up>") 'scroll-down-1)

;; Cycling through windows and frames
(global-set-key (kbd "<C-S-iso-lefttab>") 'previous-multiframe-window)
(global-set-key (kbd "<C-S-tab>") 'previous-multiframe-window)
(global-set-key (kbd "<C-tab>") 'next-multiframe-window)

;; Indentation
(global-set-key (kbd "<M-left>") 'dedent-current-region)
(global-set-key (kbd "<M-right>") 'indent-current-region)

;; Window size
(global-set-key (kbd "<M-up>") 'enlarge-window)
(global-set-key (kbd "<M-down>") 'shrink-window)

;; Function keys
(global-set-key (kbd "<M-f1>") 'toggle-text-mode-fontified)
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
(global-set-key (kbd "<M-f9>") 'sr-speedbar-toggle)
(global-set-key (kbd "<C-M-f9>") 'speedbar-refresh)
(global-set-key (kbd "<f11>") 'toggle-fullscreen)
(global-set-key (kbd "<M-f11>") 'darkroom-mode)
(global-set-key (kbd "<f12>") 'call-last-kbd-macro)
(global-set-key (kbd "<M-f12>") 'start-or-end-kbd-macro)

;; Tiling windows
(global-set-key (kbd "<S-s-return>") 'split-window-dwim)
(global-set-key (kbd "<s-return>") 'swap-with-largest-window)
(global-set-key (kbd "s-C") 'delete-window-and-balance)
(global-set-key (kbd "s-J") 'rotate-windows)
(global-set-key (kbd "s-K") 'rotate-windows-reverse)
(global-set-key (kbd "s-[") 'shrink-first-window-horizontally)
(global-set-key (kbd "s-]") 'enlarge-first-window-horizontally)
(global-set-key (kbd "s-j") 'other-window)
(global-set-key (kbd "s-k") 'other-window-reverse)

;; Buffer switching using bs-show
(global-set-key (kbd "C-x C-b") 'bs-show)
(global-set-key (kbd "C-x <C-left>") 'bs-cycle-previous)
(global-set-key (kbd "C-x <C-right>") 'bs-cycle-next)
(global-set-key (kbd "<M-s-left>") 'bs-cycle-previous)
(global-set-key (kbd "<M-s-right>") 'bs-cycle-next)
(global-set-key (kbd "s-{") 'bs-cycle-previous)
(global-set-key (kbd "s-}") 'bs-cycle-next)

;; Easier bindings for winner-mode
(global-set-key (kbd "C-c <C-left>") 'winner-undo)
(global-set-key (kbd "C-c <C-right>") 'winner-redo)
(global-set-key (kbd "<s-left>") 'winner-undo)
(global-set-key (kbd "<s-right>") 'winner-redo)

;; Line-oriented commands
(global-set-key (kbd "<home>") 'move-beginning-of-line)
(global-set-key (kbd "<end>") 'move-end-of-line)
(global-set-key (kbd "C-M-SPC") 'mark-line)
(global-set-key (kbd "C-M-k") 'kill-whole-line)
(global-set-key (kbd "C-`") 'flymake-goto-next-error)
(global-set-key (kbd "M-#") 'comment-line)
(global-set-key (kbd "M-+") 'duplicate-line)
(global-set-key (kbd "M-`") 'next-error)
(global-set-key (kbd "M-g") 'goto-line)

;; Other useful commands
(global-set-key (kbd "C-M-n") 'move-region-down)
(global-set-key (kbd "C-M-p") 'move-region-up)
(global-set-key (kbd "C-\\") 'delete-whitespace-forward)
(global-set-key (kbd "M-&") 'insert-indentation)
(global-set-key (kbd "M-'") 'insert-pair)
(global-set-key (kbd "M-\"") 'insert-pair)
(global-set-key (kbd "M-)") 'close-open-paren)
(global-set-key (kbd "M-]") 'insert-curlies)
(global-set-key (kbd "M-_") 'goto-last-change)
(global-set-key (kbd "M-q") 'fill-individual-paragraphs)
(global-set-key (kbd "M-z") 'zap-up-to-char)

;; Bind return to newline-and-indent except in text-mode
(global-set-key (kbd "RET") 'newline-and-indent)
(add-hook 'text-mode-hook
          (lambda () (local-set-key (kbd "RET") 'newline)))

;; Don't let shells steal C-up and C-down
(add-hook 'comint-mode-hook
          (lambda ()
            (local-set-key (kbd "<C-up>") nil)
            (local-set-key (kbd "<C-down>") nil)))

;; C-z should be a NOOP. -God
(global-set-key (kbd "C-z") 'ignore)

;; Swap shell bindings from emacs-starter-kit
(global-set-key (kbd "C-x m") 'shell)
(global-set-key (kbd "C-x M") 'new-shell)
(global-set-key (kbd "C-x M-m") 'eshell)
(global-set-key (kbd "C-x M-M") 'new-eshell)

;; Revert swapped isearch bindings from emacs-starter-kit
(global-set-key (kbd "C-M-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward)
(global-set-key (kbd "C-s") 'isearch-forward)

;; Revert clobbered mule bindings from emacs-starter-kit
(define-key ctl-x-map (kbd "RET") mule-keymap)

;; Fix delete key on OSX
(global-set-key (kbd "<kp-delete>") 'delete-char)
