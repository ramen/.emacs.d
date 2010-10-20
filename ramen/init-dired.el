;;; init-dired.el --- Dired mode customizations

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)))

(put 'dired-find-alternate-file 'disabled nil)

(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

(defun rdired (dir)
  (interactive "DBase directory: ")
  (require 'grep)
  (find-dired dir
              ;; Ripped from rgrep
              (concat
               (and grep-find-ignored-directories
                    (concat (shell-quote-argument "(")
                            ;; we should use shell-quote-argument here
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
                            " -prune -o "))
               (and grep-find-ignored-files
                    (concat (shell-quote-argument "(")
                            ;; we should use shell-quote-argument here
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
                            " -prune -o "))
               "-type f")))
