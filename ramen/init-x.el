;;; init-x.el --- Tweaks for X sessions.

(when (eq window-system 'x)
  ;; Prevent kills from writing to clipboard (slow over remote X sessions).
  (setq interprogram-cut-function nil)
  (setq interprogram-paste-function nil)

  ;; Define new cut/copy/paste functions for when clipboard interaction is
  ;; actually desired.
  (defun x-cut ()
    (interactive)
    (let ((interprogram-cut-function
           'x-select-text))
      (kill-region (region-beginning)
                   (region-end))))
  (defun x-copy ()
    (interactive)
    (let ((interprogram-cut-function
           'x-select-text))
      (kill-ring-save (region-beginning)
                      (region-end))))
  (defun x-paste ()
    (interactive)
    (let ((interprogram-paste-function
           'x-cut-buffer-or-selection-value))
      (yank)))

  ;; Bind cut/copy/paste to some useful keyboard shortcuts.
  (global-set-key [S-delete] 'x-cut)
  (global-set-key [S-backspace] 'x-cut)
  (global-set-key [S-kp-delete] 'x-cut)
  (global-set-key [C-insert] 'x-copy)
  (global-set-key [s-backspace] 'x-copy)
  (global-set-key [C-H-help] 'x-copy)
  (global-set-key [S-insert] 'x-paste)
  (global-set-key [H-S-help] 'x-paste)
  (global-set-key [s-mouse-2] 'x-paste)

  ;; Fix old issue with bitmap font rendering.
  (setq x-use-underline-position-properties nil)

  ;; Fancy color map for shell-mode, etc.
  (setq ansi-color-names-vector
        ["#eeeeec" "#cc0000" "#458b00" "#f57900"
         "#729fcf" "#6255bc" "#00ffff" "#888a85"])
  (setq ansi-color-map (ansi-color-make-color-map)))
