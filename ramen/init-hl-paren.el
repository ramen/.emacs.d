;;; init-hl-paren.el --- Enable highlight-parentheses mode

(when window-system
  (add-hook 'coding-hook 'highlight-parentheses-mode)

  ;; http://stackoverflow.com/questions/2413047/ddg#2413472
  (setq hl-paren-colors
        '("orange1" "yellow1" "greenyellow" "green1"
          "springgreen1" "cyan1" "slateblue1" "magenta1" "purple")))
