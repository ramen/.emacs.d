;;; init-git.el --- Git and Magit customizations

(require 'format-spec)
(require 'git-blame)

(setq git-blame-prefix-format "%h %20.20a ")
(setq git-commit-summary-max-length 72)

(defalias 'vc-blame 'vc-annotate)

(defun git-blame ()
  (interactive)
  (if git-blame-mode
      (progn
        (git-blame-mode-off)
        (toggle-truncate-lines 0))
    (progn
      (git-blame-mode-on)
      (toggle-truncate-lines 1))))

(eval-after-load 'magit
  '(progn
     (transient-suffix-put 'magit-pull "u" :key "F")
     (transient-suffix-put 'magit-push "u" :key "P")))

(eval-after-load 'magit-key-mode
  '(progn
     (dolist (switch (cdr (assoc 'switches (magit-key-mode-options-for-group 'logging))))
       (if (equal (caddr switch) "--name-only")
           (setcar switch "-no")))
     (magit-key-mode-insert-switch 'logging "-nm" "No merges" "--no-merges")
     (magit-key-mode-insert-switch 'pulling "-v" "Verbose" "-v")))

(add-hook 'magit-mode-hook
          (lambda ()
            (define-key magit-mode-map (kbd "C-1") 'magit-section-show-level-1-all)
            (define-key magit-mode-map (kbd "C-2") 'magit-section-show-level-2-all)
            (define-key magit-mode-map (kbd "C-3") 'magit-section-show-level-3-all)
            (define-key magit-mode-map (kbd "C-4") 'magit-section-show-level-4-all)
            (define-key magit-mode-map (kbd "M-1") 'digit-argument)
            (define-key magit-mode-map (kbd "M-2") 'digit-argument)
            (define-key magit-mode-map (kbd "M-3") 'digit-argument)
            (define-key magit-mode-map (kbd "M-4") 'digit-argument)))

(setq magit-auto-revert-mode nil)
(setq magit-completing-read-function 'magit-ido-completing-read)
(setq magit-default-tracking-name-function 'magit-default-tracking-name-branch-only)
(setq magit-revision-insert-related-refs nil)
(setq magit-status-buffer-switch-function 'switch-to-buffer)
