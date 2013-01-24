;;; init-powerline.el --- fancy statusline configuration

(when window-system
  (require 'powerline)

  (set-face-foreground 'mode-line "#030303")
  (set-face-background 'mode-line "#bdbdbd"))
