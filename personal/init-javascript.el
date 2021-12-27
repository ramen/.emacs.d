;;; init-javascript.el --- JavaScript mode configuration

(add-hook 'js2-mode-hook
          (lambda ()
            (esk-prog-mode-hook)
            (define-key js2-mode-map (kbd "RET") nil)))

(add-hook 'rjsx-mode-hook
          (lambda ()
            (esk-prog-mode-hook)
            (define-key rjsx-mode-map (kbd "<") nil)
            (define-key rjsx-mode-map (kbd "C-c /") 'sgml-close-tag)))

(add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.ts$" . js-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(setq js2-enter-indents-newline t)
(setq js2-mirror-mode nil)
(setq js2-strict-trailing-comma-warning nil)
