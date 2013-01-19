;;; init-thrift.el --- Thrift mode configuration

(add-to-list 'auto-mode-alist '("\\.thrift\\'" . thrift-mode))

(add-hook 'thrift-mode-hook
          (lambda ()
            (run-coding-hook)
            (set (make-local-variable 'compile-command)
                 (format "cd %s && sbt compile"
                         (locate-dominating-file default-directory ".git")))))
