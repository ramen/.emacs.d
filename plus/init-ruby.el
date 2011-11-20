;;; init-ruby.el --- Ruby mode configuration

(add-hook 'ruby-mode-hook
          (lambda ()
            (setq ruby-insert-encoding-magic-comment nil)
            (set (make-local-variable 'compile-command)
                 (format "cd %s && bundle exec rake spec"
                         (locate-dominating-file default-directory "Rakefile")))
            (set (make-local-variable 'eldoc-documentation-function)
                 'ruby-add-log-current-method)
            (eldoc-mode 1)))

(add-hook 'inf-ruby-mode-hook
          (lambda ()
            (setq inf-ruby-first-prompt-pattern "^\\(?:irb(.*?)[0-9:]+0\\|ree[^ ]* [0-9:]+ \\)> *")
            (setq inf-ruby-prompt-pattern "^\\(\\(?:irb(.*?)[0-9:]+\\|ree[^ ]* [0-9:]+ \\)[>*\"'] *\\)+")))
