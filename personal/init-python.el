;;; init-python.el --- Python mode configuration

(add-hook 'python-mode-hook
          (lambda ()
            (esk-prog-mode-hook)
            (when (boundp 'python-mode-map)
              (define-key python-mode-map "\C-c\C-s" 'python-shell))
            (when (boundp 'py-mode-map)
              (define-key py-mode-map "\C-c\C-l" 'py-execute-import-or-reload)
              (define-key py-mode-map "\C-c\C-r" 'py-execute-region)
              (define-key py-mode-map "\C-c\C-s" 'py-shell))
            (setq py-shell-switch-buffers-on-execute nil)
            (cond ((fboundp 'subword-mode) (subword-mode 1))
                  ((fboundp 'c-subword-mode) (c-subword-mode 1)))))

(defun py-convert-unicode (start end)
  (interactive "r")
  (let ((command (concat user-specific-dir "/convert-unicode.py")))
    (shell-command-on-region start end command nil t)))
