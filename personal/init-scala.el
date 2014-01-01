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
                 (let ((pants-dir (locate-dominating-file default-directory "BUILD"))
                       (mvn-dir (locate-dominating-file default-directory "pom.xml"))
                       (sbt-dir (locate-dominating-file default-directory "project")))
                   (cond (pants-dir
                          (let* ((pants-root (locate-dominating-file default-directory "pants"))
                                 (src-dir (locate-dominating-file default-directory "src"))
                                 (proj-dirs (nreverse (split-string src-dir "/" t)))
                                 (subproj (pop proj-dirs))
                                 (proj (pop proj-dirs)))
                                 (format "cd %s && ./pants goal test %s/%s:tests"
                                         pants-root
                                         (if (member proj '("b" "birdcage")) "." proj)
                                         subproj)))
                         (mvn-dir (format "cd %s && mvn test" mvn-dir))
                         (sbt-dir (format "cd %s && sbt test" sbt-dir)))))
            (cond ((fboundp 'subword-mode) (subword-mode 1))
                  ((fboundp 'c-subword-mode) (c-subword-mode 1)))))
