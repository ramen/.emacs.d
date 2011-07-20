;;; init-git.el --- Git and Magit customizations

(require 'git-blame)

(setq git-blame-prefix-format "%h %20.20a ")

(defalias 'git-blame 'git-blame-mode)
(defalias 'vc-blame 'vc-annotate)

(add-hook 'magit-mode-hook
          (lambda ()
            (define-key magit-mode-map (kbd "M-1") 'digit-argument)
            (define-key magit-mode-map (kbd "M-2") 'digit-argument)
            (define-key magit-mode-map (kbd "M-3") 'digit-argument)
            (define-key magit-mode-map (kbd "M-4") 'digit-argument)
            (define-key magit-mode-map (kbd "C-1") 'magit-show-level-1-all)
            (define-key magit-mode-map (kbd "C-2") 'magit-show-level-2-all)
            (define-key magit-mode-map (kbd "C-3") 'magit-show-level-3-all)
            (define-key magit-mode-map (kbd "C-4") 'magit-show-level-4-all)
            (delete-other-windows)))

(eval-after-load 'magit
  '(magit-key-mode-insert-switch 'pushing "-u" "Set upstream" "-u"))