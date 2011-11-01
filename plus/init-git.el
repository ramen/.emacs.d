;;; init-git.el --- Git and Magit customizations

(require 'format-spec)
(require 'git-blame)

(setq git-blame-prefix-format "%h %20.20a ")

(defalias 'git-blame 'git-blame-mode)
(defalias 'vc-blame 'vc-annotate)

(add-hook 'magit-mode-hook
          (lambda ()
            (define-key magit-mode-map (kbd "M-1") 'digit-argument)
            (define-key magit-mode-map (kbd "M-2") 'digit-argument)
            (define-key magit-mode-map (kbd "M-3") 'digit-argument)
            (define-key magit-mode-map (kbd "M-4") 'digit-argument)
            (define-key magit-mode-map (kbd "C-1") 'magit-show-level-1-all)
            (define-key magit-mode-map (kbd "C-2") 'magit-show-level-2-all)
            (define-key magit-mode-map (kbd "C-3") 'magit-show-level-3-all)
            (define-key magit-mode-map (kbd "C-4") 'magit-show-level-4-all)))

(eval-after-load 'magit
  '(magit-key-mode-insert-switch 'pushing "-u" "Set upstream" "-u"))

(defun magit-ido-completing-read (prompt choices &optional predicate require-match initial-input hist def)
  "ido-based completing-read almost-replacement."
  (require 'ido)
  (let ((selected (ido-completing-read prompt (if (consp (first choices))
                                                  (mapcar #'car choices)
                                                choices)
                                       predicate require-match initial-input hist def)))
    (if (consp (first choices))
        (or (cdr (assoc selected choices))
            selected)
      selected)))

(setq magit-completing-read-function 'magit-ido-completing-read)
