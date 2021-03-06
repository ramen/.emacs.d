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
     (magit-define-popup-switch 'magit-log-popup ?f "first parent" "--first-parent")
     (magit-remove-popup-key 'magit-diff-popup   :action ?d)
     (magit-change-popup-key 'magit-diff-popup   :action ?r ?d)
     ;; https://github.com/magit/magit/wiki/Restore-pre-v2.4-key-bindings
     (magit-change-popup-key 'magit-fetch-popup  :action ?u ?f)
     (magit-change-popup-key 'magit-pull-popup   :action ?u ?F)
     (magit-change-popup-key 'magit-rebase-popup :action ?e ?r)
     (magit-change-popup-key 'magit-push-popup   :action ?p ?P)))

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
