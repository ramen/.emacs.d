(color-theme-tango-2)

(global-hl-line-mode 1)
(set-face-background 'hl-line "gray10")

(add-hook 'magit-mode-hook
          (lambda ()
            (set-face-background 'magit-item-highlight "gray20")))
