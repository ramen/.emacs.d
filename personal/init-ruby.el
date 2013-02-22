;;; init-ruby.el --- Ruby mode configuration

(add-hook 'ruby-mode-hook
          (lambda ()
            (esk-prog-mode-hook)
            (define-key ruby-mode-map (kbd "RET") nil)
            (setq ruby-insert-encoding-magic-comment nil)
            (set (make-local-variable 'compile-command)
                 (format "cd %s && bundle exec rake"
                         (locate-dominating-file default-directory "Rakefile")))
            (cond ((fboundp 'subword-mode) (subword-mode 1))
                  ((fboundp 'c-subword-mode) (c-subword-mode 1)))))

(add-hook 'inf-ruby-mode-hook
          (lambda ()
            (setq inf-ruby-first-prompt-pattern "^\\(?:irb(.*?)[0-9:]+0\\|ree[^ ]* [0-9:]+ \\)> *")
            (setq inf-ruby-prompt-pattern "^\\(\\(?:irb(.*?)[0-9:]+\\|ree[^ ]* [0-9:]+ \\)[>*\"'] *\\)+")))
