;;; init-mustache.el --- Mustache mode configuration

(require 'mustache-mode)

(add-hook 'mustache-mode-hook
          (lambda ()
            (esk-prog-mode-hook)
            (setq comment-start-skip "\\(\\(^\\|[^\\\\\n]\\)\\(\\\\\\\\\\)*\\);+ *")
            (turn-off-auto-fill)
            (zencoding-mode)))

(autoload 'sgml-close-tag "sgml-mode")

(define-key mustache-mode-map (kbd "C-c /") 'sgml-close-tag)
(define-key mustache-mode-map (kbd "RET") nil)
