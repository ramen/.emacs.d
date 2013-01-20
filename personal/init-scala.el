;;; init-scala.el --- Scala mode configuration

(require 'scala-mode-auto)

(add-hook 'scala-mode-hook
          (lambda ()
            (esk-prog-mode-hook)
            (define-key scala-mode-map (kbd "<f1>") nil)
            ;; http://stackoverflow.com/questions/3614448/emacs-scala-mode-newline-and-indent-weirdness
            (define-key scala-mode-map (kbd "RET")
              (lambda () (interactive)
                (setq last-command nil)
                (newline-and-indent)))
            (define-key scala-mode-map (kbd "C-c C-s") 'scala-run-scala)
            (set (make-local-variable 'compile-command)
                 (let ((mvn-dir (locate-dominating-file default-directory "pom.xml")))
                   (if mvn-dir
                       (let* ((proj-dirs (nreverse (split-string mvn-dir "/" t)))
                              (subproj (pop proj-dirs))
                              (proj (pop proj-dirs))
                              (top (mapconcat 'identity (nreverse proj-dirs) "/")))
                         (format "cd %s && mvn -pl :%s-%s -am compile" top proj subproj))
                     (format "cd %s && sbt test"
                             (locate-dominating-file default-directory "project")))))))
