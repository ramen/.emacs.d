;;; init-bs.el --- buffer selection mode configuration

(require 'bs)

(let ((name "custom")
      (must-show-regexp nil)
      (must-show-function nil)
      (dont-show-regexp "^\\*\\(Compile-Log\\|Completions\\|Help\\|Messages\\|scratch\\)\\*$")
      (dont-show-function (lambda (buf)
                            (with-current-buffer buf
                              (eq major-mode 'dired-mode))))
      (buffer-sort-function 'bs-sort-buffer-interns-are-last))
  (add-to-list 'bs-configurations
               (list name
                     must-show-regexp must-show-function
                     dont-show-regexp dont-show-function
                     buffer-sort-function)))

(setq bs-default-configuration "custom")
