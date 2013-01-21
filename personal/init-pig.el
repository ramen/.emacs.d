;;; init-pig.el --- Pig mode configuration

(require 'pig-mode)

(add-hook 'pig-mode-hook
          (lambda ()
            (esk-prog-mode-hook)))
