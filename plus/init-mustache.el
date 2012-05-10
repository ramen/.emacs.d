;;; init-mustache.el --- Mustache mode configuration

(require 'mustache-mode)

(add-hook 'mustache-mode-hook
          (lambda ()
            (run-coding-hook)
            (setq comment-start-skip "\\(\\(^\\|[^\\\\\n]\\)\\(\\\\\\\\\\)*\\);+ *")
            (zencoding-mode)))

(define-key mustache-mode-map (kbd "C-c /") 'sgml-close-tag)
(define-key mustache-mode-map (kbd "C-c C-t") 'sgml-tag)
(define-key mustache-mode-map (kbd "RET") nil)
