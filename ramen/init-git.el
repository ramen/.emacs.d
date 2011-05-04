;;; init-git.el --- Git and Magit customizations

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

;; I know there's a keyboard shortcut for this.
;; That doesn't mean I have to like it.
(defalias 'vc-blame 'vc-annotate)
