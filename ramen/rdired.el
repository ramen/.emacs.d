;;; rdired.el --- Recursive dired command

(defun rdired (dir)
  "Recursive dired. Runs find-dired, passing an expression to the find command
that hides boring files and directories like rgrep does."
  (interactive "DBase directory: ")
  (require 'grep)
  (find-dired dir
              ;; Ripped from rgrep
              (concat
               (and grep-find-ignored-directories
                    (concat "-not "
                            (shell-quote-argument "(")
                            " "
                            (shell-quote-argument "(")
                            " -path "
                            (mapconcat
                             #'(lambda (ignore)
                                 (cond ((stringp ignore)
                                        (shell-quote-argument
                                         (concat "*/" ignore)))
                                       ((consp ignore)
                                        (and (funcall (car ignore) dir)
                                             (shell-quote-argument
                                              (concat "*/"
                                                      (cdr ignore)))))))
                             grep-find-ignored-directories
                             " -o -path ")
                            " "
                            (shell-quote-argument ")")
                            " -prune "
                            (shell-quote-argument ")")
                            " "))
               (and grep-find-ignored-files
                    (concat "-not "
                            (shell-quote-argument "(")
                            " "
                            (shell-quote-argument "(")
                            " -name "
                            (mapconcat
                             #'(lambda (ignore)
                                 (cond ((stringp ignore)
                                        (shell-quote-argument ignore))
                                       ((consp ignore)
                                        (and (funcall (car ignore) dir)
                                             (shell-quote-argument
                                              (cdr ignore))))))
                             grep-find-ignored-files
                             " -o -name ")
                            " "
                            (shell-quote-argument ")")
                            " -prune "
                            (shell-quote-argument ")")
                            " ")))))
