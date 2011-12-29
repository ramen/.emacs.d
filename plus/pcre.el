;;; pcre.el --- Use Perl-compatible regular expressions

(setq grep-command "grep -nHP -e "
      grep-find-template "find . <X> -type f <F> -exec grep <C> -nHP -e <R> {} /dev/null \\;")

(defun grep-occur (regexp &optional nlines)
  (interactive (occur-read-primary-args))
  (save-some-buffers)
  (grep (concat grep-command
                (shell-quote-argument regexp)
                (if nlines
                    (if (> nlines 0)
                        (format " -C %d " nlines)
                      (format " -B %d " (abs nlines)))
                  " ")
                (buffer-file-name))))
