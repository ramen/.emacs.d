;;; init-scala.el --- Scala mode configuration

(require 'scala-mode-auto)

(add-hook 'scala-mode-hook
          (lambda ()
            (run-coding-hook)
            (define-key scala-mode-map (kbd "<f1>") nil)
            ;; http://stackoverflow.com/questions/3614448/emacs-scala-mode-newline-and-indent-weirdness
            (define-key scala-mode-map (kbd "RET")
              (lambda () (interactive)
                (setq last-command nil)
                (newline-and-indent)))
            (define-key scala-mode-map (kbd "C-c C-s") 'scala-run-scala)
            (set (make-local-variable 'compile-command)
                 (format "cd %s && sbt test"
                         (locate-dominating-file default-directory "project")))))
