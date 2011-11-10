;;; init-mustache.el --- Mustache mode configuration

(require 'mustache-mode)

(add-hook 'tpl-mode-hook
          (lambda ()
            (run-coding-hook)
            (zencoding-mode)))

(define-key tpl-mode-map (kbd "C-c /") 'sgml-close-tag)
(define-key tpl-mode-map (kbd "C-c C-t") 'sgml-tag)
(define-key tpl-mode-map (kbd "RET") nil)
