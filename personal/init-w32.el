;;; init-w32.el --- Tweaks for Windows sessions.

(when (eq window-system 'w32)
  (unbold-all-faces)
  (add-hook 'after-change-major-mode-hook 'unbold-all-faces)
  (setq find-ls-option '("-exec ls -ld {} \\;" . "-ld"))
  (setq find-program "wsl find")
  (setq diff-command "wsl diff")
  (setq frame-title-format "%b")
  (setq grep-find-template "wsl find . <X> -type f <F> -exec grep <C> -nHP -e <R> {} /dev/null \\;")
  (setq ;; w32-pass-lwindow-to-system nil
        ;; w32-pass-rwindow-to-system nil
        w32-lwindow-modifier 'super
        w32-rwindow-modifier 'super
        w32-apps-modifier 'hyper))
