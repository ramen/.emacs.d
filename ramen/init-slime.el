;;; init-slime.el --- Superior Lisp interaction mode configuration

(when (require 'slime nil t)
  (slime-setup '(slime-fancy slime-banner)))
