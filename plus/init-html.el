;;; init-html.el --- HTML mode customizations

(add-hook 'sgml-mode-hook
          (lambda ()
            (run-coding-hook)
            (local-set-key (kbd "RET") nil)
            (setq paragraph-start "\f\\|[ \t]*$"
                  paragraph-separate "[ \t\f]*$")
            (zencoding-mode)))

(eval-after-load 'sgml-mode
  '(progn
     (setcdr (assoc "br" html-tag-alist) '(t))
     (setcdr (assoc "li" html-tag-alist) nil)
     (setcdr (assoc "p" html-tag-alist) nil)))
