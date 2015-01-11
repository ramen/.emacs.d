;;; init-ruby.el --- Ruby mode configuration

(add-hook 'ruby-mode-hook
          (lambda ()
            (esk-prog-mode-hook)
            (flymake-ruby-load)
            (define-key ruby-mode-map (kbd "RET") nil)
            (setq ruby-insert-encoding-magic-comment nil)
            (set (make-local-variable 'compile-command)
                 (format "cd %s && bundle exec rake"
                         (locate-dominating-file default-directory "Rakefile")))
            (cond ((fboundp 'subword-mode) (subword-mode 1))
                  ((fboundp 'c-subword-mode) (c-subword-mode 1)))))

(eval-after-load 'inf-ruby
  '(define-key inf-ruby-minor-mode-map
     (kbd "C-c C-s") 'inf-ruby-console-auto))

(setq ruby-deep-arglist nil)
(setq ruby-deep-indent-paren nil)
(setq ruby-deep-indent-paren-style nil)

;;; fix closing paren indentation. Stolen from
;;; https://gist.github.com/1274520
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))
