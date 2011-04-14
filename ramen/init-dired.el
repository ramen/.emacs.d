;;; init-dired.el --- Dired mode customizations

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)
            (setq truncate-lines t)))

(add-hook 'grep-mode-hook
          (lambda ()
            (setq truncate-lines t)))

(put 'dired-find-alternate-file 'disabled nil)

(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

(defalias 'fndired 'find-name-dired)
