;;; init-colors.el --- Color scheme configuration

(require 'color-theme)

(color-theme-tango-2)

(global-hl-line-mode 1)
(set-face-background 'hl-line "gray10")

(add-hook 'erc-mode-hook
          (lambda ()
            (make-local-variable 'global-hl-line-mode)
            (setq global-hl-line-mode nil)
            (set-face-foreground 'erc-input-face "#fcaf3e")
            (set-face-foreground 'erc-nick-default-face "#729fcf")
            (set-face-foreground 'erc-timestamp-face "gray30")))

(add-hook 'magit-mode-hook
          (lambda ()
            (set-face-background 'magit-item-highlight "gray20")))

(set-face-background 'show-paren-match "gray30")

(unless window-system
  (make-face-bold 'default)
  (make-face-bold 'mode-line)
  (make-face-bold 'region)
  (make-face-unbold 'isearch)
  (set-face-background 'mode-line "gray")
  (set-face-background 'region "gray")
  (set-face-background 'show-paren-match "gray")
  (set-face-background 'show-paren-mismatch "red")
  (set-face-foreground 'esk-paren-face "black")
  (set-face-foreground 'font-lock-function-name-face "blue")
  (set-face-foreground 'font-lock-string-face "green")
  (set-face-foreground 'isearch "black")
  (set-face-foreground 'isearch-lazy-highlight-face "black"))
