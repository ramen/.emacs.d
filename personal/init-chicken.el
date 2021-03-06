;;; init-chicken.el --- Chicken Scheme configuration

(autoload 'chicken-slime "chicken-slime" "SWANK backend for Chicken" t)

(setq swank-chicken-path
      (concat dotfiles-dir "/vendor/swank-chicken.scm"))

(add-hook 'scheme-mode-hook (lambda () (slime-mode t)))
