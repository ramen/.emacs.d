(setq default-mode-line-format
      (list '(:eval (if (buffer-modified-p) "* " "  "))
            "%20b  %[("
            'mode-name
            'minor-mode-alist
            ")%]  "
            '(which-func-mode ("" which-func-format "  "))
            '(line-number-mode "Line %3l  ")
            '(column-number-mode "Col %2c  ")
            'default-directory))

(setq mode-line-format default-mode-line-format)
