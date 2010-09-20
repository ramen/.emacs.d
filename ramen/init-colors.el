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

(unless window-system
  (make-face-bold 'mode-line)
  (set-face-background 'mode-line "blue")
  (set-face-background 'region "blue"))
