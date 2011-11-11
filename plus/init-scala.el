;;; init-scala.el --- Scala mode configuration

(require 'sbt)

(add-hook 'scala-mode-hook
          (lambda ()
            (run-coding-hook)
            (define-key scala-mode-map (kbd "<f1>") nil)
            ;; http://stackoverflow.com/questions/3614448/emacs-scala-mode-newline-and-indent-weirdness
            (define-key scala-mode-map (kbd "RET")
              (lambda () (interactive)
                (setq last-command nil)
                (newline-and-indent)))))

(defun scala-goto-block-start (block-start)
  (real-goto-char block-start)
  (end-of-line)
  (if (scala-looking-at-backward scala-expr-start-re)
      (real-goto-char (+ (current-indentation) scala-mode-indent:step 1))
    (real-goto-char block-start)))

(defadvice scala-indentation-from-following (around scala-indentation-fix-1 activate)
  "Fix broken indentation within blocks"
  (flet ((real-goto-char (position) (goto-char position))
         (goto-char (position) (scala-goto-block-start position)))
    ad-do-it))

(defadvice scala-indentation-from-block (around scala-indentation-fix-2 activate)
  "Fix broken indentation within blocks"
  (flet ((real-goto-char (position) (goto-char position))
         (goto-char (position) (scala-goto-block-start position)))
    ad-do-it))
