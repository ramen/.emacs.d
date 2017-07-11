;;; init-scala.el --- Scala mode configuration

(require 'scala-mode-auto)

(add-to-list 'auto-mode-alist '("\\.sc$" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.strato$" . scala-mode))

(add-hook 'scala-mode-hook
          (lambda ()
            (esk-prog-mode-hook)
            (define-key scala-mode-map (kbd "<f1>") nil)
            ;; http://stackoverflow.com/questions/3614448/emacs-scala-mode-newline-and-indent-weirdness
            (define-key scala-mode-map (kbd "RET")
              (lambda () (interactive)
                (setq last-command nil)
                (newline-and-indent)))
            (define-key scala-mode-map (kbd "C-c C-s") 'scala-run-scala)
            (set-pants-compile-command)
            (cond ((fboundp 'subword-mode) (subword-mode 1))
                  ((fboundp 'c-subword-mode) (c-subword-mode 1)))))

(defun set-pants-compile-command ()
  (set (make-local-variable 'compile-command)
       (let* ((current-dir (file-truename default-directory))
              (pants-dir (locate-dominating-file current-dir "BUILD"))
              (pants-root (locate-dominating-file current-dir "pants"))
              (src-dir (locate-dominating-file current-dir "src"))
              (proj-dirs (nreverse (split-string src-dir "/" t)))
              (subproj (pop proj-dirs))
              (proj (pop proj-dirs))
              (target (if (equal proj "source")
                          subproj
                        (format "%s/%s" proj subproj)))
              (target (if (equal target "strato")
                          "strato/src/test"
                        target)))
         (format "cd %s && ./pants test %s::" pants-root target))))
