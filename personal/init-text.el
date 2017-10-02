;;; init-text.el --- Text mode configuration

(add-hook 'text-mode-hook
          (lambda ()
            (visual-line-mode t)
            (window-margin-mode t)))
