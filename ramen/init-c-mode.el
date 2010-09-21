;;; init-c-mode.el --- c-mode settings

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-style "java")
            (c-set-offset 'case-label '+)
            (c-set-offset 'substatement-open 0)
            (setq c-basic-offset tab-width)
            (setq comment-start "// ")
            (setq comment-end "")
            (setq comment-start-skip "// *")
            (cond ((fboundp 'subword-mode) (subword-mode 1))
                  ((fboundp 'c-subword-mode) (c-subword-mode 1)))))
