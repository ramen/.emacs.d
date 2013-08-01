;;; init-hl-paren.el --- Enable highlight-parentheses mode

(when window-system
  (add-hook 'prog-mode-hook 'turn-on-highlight-parentheses-mode))

(defun turn-on-highlight-parentheses-mode ()
  (highlight-parentheses-mode t))

(setq hl-paren-colors
      '("#ff0000" "#fce94f" "#458b00" "#729fcf" "#6255bc" "#ad7fa8"))
