;;; init-smex.el --- Smex customizations

;; Make space key insert a hyphen like M-x
;; http://www.emacswiki.org/emacs/Smex
(defadvice smex (around space-inserts-hyphen activate compile)
  (let ((ido-cannot-complete-command
         `(lambda ()
            (interactive)
            (if (string= " " (this-command-keys))
                (insert ?-)
              (funcall ,ido-cannot-complete-command)))))
    ad-do-it))
