;;; init-html.el --- HTML mode customizations

(add-hook 'sgml-mode-hook
          (lambda ()
            (run-coding-hook)
            (local-set-key (kbd "RET") nil)
            (zencoding-mode)))

(eval-after-load 'sgml-mode
  '(progn
     (setcdr (assoc "p" html-tag-alist) nil)
     (setcdr (assoc "br" html-tag-alist) '(t))))
