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

(add-hook 'tuareg-mode-hook
          (lambda ()
            (set-face-foreground 'tuareg-font-lock-operator-face "gray30")))

(set-face-background 'show-paren-match "gray30")
(setq vc-annotate-background "unspecified")

(unless window-system
  (add-hook 'dired-mode-hook
            (lambda ()
              (set-face-foreground 'dired-header "yellow")))
  (make-face-bold 'default)
  (make-face-unbold 'font-lock-type-face)
  (make-face-unbold 'font-lock-warning-face)
  (make-face-unbold 'ido-only-match)
  (make-face-unbold 'isearch)
  (set-face-background 'isearch "yellow")
  (set-face-background 'mode-line "gray")
  (set-face-background 'region "gray")
  (set-face-background 'show-paren-match "gray")
  (set-face-background 'show-paren-mismatch "red")
  (set-face-foreground 'default "black")
  (set-face-foreground 'esk-paren-face "white")
  (set-face-foreground 'font-lock-builtin-face "blue")
  (set-face-foreground 'font-lock-comment-face "white")
  (set-face-foreground 'font-lock-comment-delimiter-face "white")
  (set-face-foreground 'font-lock-preprocessor-face "blue")
  (set-face-foreground 'font-lock-function-name-face "blue")
  (set-face-foreground 'font-lock-string-face "green")
  (set-face-foreground 'font-lock-variable-name-face "black")
  (set-face-foreground 'isearch "black")
  (set-face-foreground 'isearch-lazy-highlight-face "black")
  (set-face-foreground 'minibuffer-prompt "blue")
  (set-face-foreground 'match "black")
  (set-face-foreground 'mode-line "black")
  (set-face-foreground 'show-paren-match "black")
  (set-face-foreground 'show-paren-mismatch "white"))
