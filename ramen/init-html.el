;;; init-html.el --- HTML mode customizations

(eval-after-load 'sgml-mode
  '(progn
     (setcdr (assoc "p" html-tag-alist) nil)
     (setcdr (assoc "br" html-tag-alist) '(t))))
