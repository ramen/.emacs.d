;;; init-mode-line.el --- Mode line configuration

(setq mode-line-format
      (list '(:eval (if (buffer-modified-p) "* " "  "))
            "%20b  %[("
            'mode-name
            'minor-mode-alist
            ")%]  "
            '(line-number-mode "Line %3l  ")
            '(column-number-mode "Col %2c  ")
            '(which-func-mode ("" which-func-format "  "))
            (make-string 1000 ? )))

(setq default-mode-line-format mode-line-format)
