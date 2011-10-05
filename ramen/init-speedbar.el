;;; init-speedbar-el --- Speedbar configuration

(require 'sr-speedbar)

(add-hook 'speedbar-mode-hook
          (lambda ()
            (define-key speedbar-file-key-map "." 'speedbar-up-directory)))

(setq speedbar-show-unknown-files t
      speedbar-use-images nil
      sr-speedbar-auto-refresh nil
      sr-speedbar-right-side nil)
