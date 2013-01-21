;;; init-rainbows.el --- Enable rainbow-delimiters mode

(when window-system
  (require 'rainbow-delimiters)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode-enable)
  (set-face-foreground 'rainbow-delimiters-depth-1-face "orange1")
  (set-face-foreground 'rainbow-delimiters-depth-2-face "yellow1")
  (set-face-foreground 'rainbow-delimiters-depth-3-face "greenyellow")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "green1")
  (set-face-foreground 'rainbow-delimiters-depth-5-face "springgreen1")
  (set-face-foreground 'rainbow-delimiters-depth-6-face "cyan1")
  (set-face-foreground 'rainbow-delimiters-depth-7-face "slateblue1")
  (set-face-foreground 'rainbow-delimiters-depth-8-face "magenta1")
  (set-face-foreground 'rainbow-delimiters-depth-9-face "purple"))
