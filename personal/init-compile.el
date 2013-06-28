;;; init-compile.el --- compilation settings

(require 'ansi-color)

(defun colorize-compilation-buffer ()
  (unless (eq major-mode 'grep-mode)
    (toggle-read-only)
    (ansi-color-apply-on-region (point-min) (point-max))
    (toggle-read-only)))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(autoload 'recompile "compile")
