;;; init-w32.el --- Tweaks for Windows sessions.

(when (eq window-system 'w32)
  (unbold-all-faces)
  (add-hook 'after-change-major-mode-hook 'unbold-all-faces)
  (setq find-program "gfind"))
