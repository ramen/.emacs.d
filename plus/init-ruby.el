;;; init-ruby.el --- Ruby mode configuration

(add-hook 'ruby-mode-hook
          (lambda ()
            (setq ruby-insert-encoding-magic-comment nil)))

(add-hook 'inf-ruby-mode-hook
          (lambda ()
            (setq inf-ruby-first-prompt-pattern "^\\(?:irb(.*?)[0-9:]+0\\|ree[^ ]* [0-9:]+ \\)> *")
            (setq inf-ruby-prompt-pattern "^\\(\\(?:irb(.*?)[0-9:]+\\|ree[^ ]* [0-9:]+ \\)[>*\"'] *\\)+")))
