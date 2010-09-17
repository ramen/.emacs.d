;;; init-colors.el --- Color scheme configuration

(color-theme-tango-2)

(global-hl-line-mode 1)
(set-face-background 'hl-line "gray10")

(add-hook 'magit-mode-hook
          (lambda ()
            (set-face-background 'magit-item-highlight "gray20")))

(unless window-system
  (make-face-bold 'mode-line)
  (set-face-background 'mode-line "blue")
  (set-face-background 'region "blue"))
