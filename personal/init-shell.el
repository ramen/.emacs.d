;;; init-shell.el --- shell mode

(setq auto-mode-alist (cons '("\\.zsh$" . sh-mode) auto-mode-alist))

;; http://oremacs.com/2015/01/01/three-ansi-term-tips/
(eval-after-load "term"
  '(define-key term-raw-map (kbd "C-c C-y") 'term-paste))
