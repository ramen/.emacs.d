;;; init-javascript.el --- JavaScript mode configuration

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'js2-mode-hook
          (lambda ()
            (esk-prog-mode-hook)
            (define-key js2-mode-map (kbd "RET") nil)))

(setq js2-enter-indents-newline t)
(setq js2-mirror-mode nil)
