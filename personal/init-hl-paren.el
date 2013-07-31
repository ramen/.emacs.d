;;; init-hl-paren.el --- Enable highlight-parentheses mode

(when window-system
  (add-hook 'prog-mode-hook 'turn-on-highlight-parentheses-mode))

(defun turn-on-highlight-parentheses-mode ()
  (highlight-parentheses-mode t))

;; http://stackoverflow.com/questions/2413047/ddg#2413472
(setq hl-paren-colors
      '("purple" "magenta1" "slateblue1" "cyan1" "springgreen1"
        "green1" "greenyellow" "yellow1" "orange1"))
