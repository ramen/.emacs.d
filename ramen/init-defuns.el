(defun comment-line ()
  (interactive)
  (if (= (line-beginning-position) (line-end-position))
      (next-line 1)
    (progn
      (back-to-indentation)
      (set-mark-command nil)
      (end-of-line nil)
      (comment-dwim nil)
      (back-to-indentation)
      (next-line 1))))

(defun delete-whitespace-forward ()
  (interactive)
  (delete-region
   (point)
   (progn
     (skip-chars-forward " \t")
     (point))))

(defun duplicate-line ()
  (interactive)
  (let ((col (current-column)))
    (beginning-of-line 1)
    (kill-new "")
    (kill-line 1)
    (yank)
    (yank)
    (previous-line 1)
    (move-to-column col)))

(defun follow-mode-quit ()
  (interactive)
  (delete-other-windows)
  (turn-off-follow-mode))

(defun indent-current-region-by (num-spaces)
  (indent-rigidly (region-beginning) (region-end) num-spaces))

(defun indent-current-region ()
  (interactive)
  (indent-current-region-by tab-width))

(defun dedent-current-region ()
  (interactive)
  (indent-current-region-by (- tab-width)))

(defun insert-curlies ()
  (interactive)
  (end-of-line nil)
  (just-one-space)
  (insert-string "{")
  (newline)
  (insert-string "}")
  (indent-according-to-mode)
  (previous-line 1)
  (end-of-line nil)
  (newline-and-indent))

(unless (fboundp 'kill-whole-line)
  (defun kill-whole-line (&optional arg)
    (interactive "p")
    (unwind-protect
        (mark-line arg)
      (kill-region (region-beginning) (region-end)))))

(defun mark-line (arg)
  (interactive "p")
  (beginning-of-line nil)
  (set-mark-command nil)
  (forward-line arg))

(defun open-shell-pane ()
  (interactive)
  (split-window-vertically -10)
  (other-window 1)
  (shell))

(defun rotate-windows ()
  (interactive)
  (let ((this-buffer (buffer-name)))
    (other-window 1)
    (let ((that-buffer (buffer-name)))
      (switch-to-buffer this-buffer)
      (other-window -1)
      (switch-to-buffer that-buffer)
      (other-window 1))))

(defun scroll-down-1 ()
  (interactive)
  (scroll-down 1))

(defun scroll-up-1 ()
  (interactive)
  (scroll-up 1))

(defun start-or-end-kbd-macro ()
  "Start defining a keyboard macro, or stop if we're already defining."
  (interactive)
  (if defining-kbd-macro
      (end-kbd-macro)
    (start-kbd-macro nil)))

(defun toggle-show-trailing-whitespace ()
  "Toggles the highlighting of trailing whitespace."
  (interactive)
  (set-variable 'show-trailing-whitespace (not show-trailing-whitespace)))

(defun turn-on-paredit ())
