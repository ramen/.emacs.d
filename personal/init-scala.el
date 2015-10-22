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
            (set-pants-compile-command)
            (cond ((fboundp 'subword-mode) (subword-mode 1))
                  ((fboundp 'c-subword-mode) (c-subword-mode 1)))))

(defun set-pants-compile-command ()
  (set (make-local-variable 'compile-command)
       (let* ((pants-dir (locate-dominating-file default-directory "BUILD"))
              (pants-root (locate-dominating-file default-directory "pants"))
              (src-dir (locate-dominating-file default-directory "src"))
              (proj-dirs (nreverse (split-string src-dir "/" t)))
              (subproj (pop proj-dirs))
              (proj (pop proj-dirs)))
         (format "cd %s && ./pants test %s/%s::"
                 pants-root
                 proj
                 subproj))))
