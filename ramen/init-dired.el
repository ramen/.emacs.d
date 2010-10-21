;;; init-dired.el --- Dired mode customizations

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)))

(put 'dired-find-alternate-file 'disabled nil)

(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
