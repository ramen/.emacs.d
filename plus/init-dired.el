;;; init-dired.el --- Dired mode customizations

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map "." 'dired-up-directory)
            (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)
            (define-key dired-mode-map "l" 'dired-vc-log)
            (setq truncate-lines t)))

(add-hook 'grep-mode-hook
          (lambda ()
            (setq truncate-lines t)))

(add-hook 'log-view-mode-hook
          (lambda ()
            (define-key log-view-mode-map (kbd "RET")
              'log-view-diff-changeset)))

(put 'dired-find-alternate-file 'disabled nil)

(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

(defalias 'fndired 'find-name-dired)