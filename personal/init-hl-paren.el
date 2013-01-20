;;; init-hl-paren.el --- Enable highlight-parentheses mode

(when window-system
  (add-hook 'prog-mode-hook 'turn-on-highlight-parentheses-mode))

(defun turn-on-highlight-parentheses-mode ()
  (highlight-parentheses-mode t))

;; http://stackoverflow.com/questions/2413047/ddg#2413472
(setq hl-paren-colors
      '("orange1" "yellow1" "greenyellow" "green1"
        "springgreen1" "cyan1" "slateblue1" "magenta1" "purple"))
