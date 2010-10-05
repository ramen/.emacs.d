;;; init-defuns.el --- Custom functions

(defun bold-all-faces ()
  "Adds bolding to all defined faces."
  (interactive)
  (mapc 'make-face-bold (face-list)))

(defun unbold-all-faces ()
  "Removes bolding from all defined faces."
  (interactive)
  (mapc 'make-face-unbold (face-list)))

(defun comment-line ()
  "Comment or uncomment the current line."
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

(defun condense-blank-lines ()
  (interactive)
  (replace-regexp "\n\n\n+" "\n\n" nil
                  (if (and transient-mark-mode mark-active)
                      (region-beginning))
                  (if (and transient-mark-mode mark-active)
                      (region-end))))

(defun delete-whitespace-forward ()
  "Delete all whitespace between point and the next non-whitespace character."
  (interactive)
  (delete-region
   (point)
   (progn
     (skip-chars-forward " \t")
     (point))))

(defun duplicate-line ()
  "Clone the current line without changing the column position."
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
  "Quit follow-mode without leaving extra windows around."
  (interactive)
  (delete-other-windows)
  (turn-off-follow-mode))

(defun indent-current-region-by (num-spaces)
  "Indent the current region by a certain number of spaces."
  (indent-rigidly (region-beginning) (region-end) num-spaces))

(defun indent-current-region ()
  "Indent the current region by the current tab width."
  (interactive)
  (indent-current-region-by tab-width))

(defun dedent-current-region ()
  "Dedent the current region by the current tab width."
  (interactive)
  (indent-current-region-by (- tab-width)))

(defun insert-curlies ()
  "Insert an opening curly brace at the end of the current line, a closing
curly brace on a new line, and position the point on a new, indented line in
between."
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
    "Kill the entire current line regardless of cursor position."
    (interactive "p")
    (unwind-protect
        (mark-line arg)
      (kill-region (region-beginning) (region-end)))))

(defun mark-line (arg)
  "Mark the entire current line regardless of cursor position."
  (interactive "p")
  (beginning-of-line nil)
  (set-mark-command nil)
  (forward-line arg))

(defun move-region-down (arg)
  (interactive "p")
  (unless mark-active (mark-line 1))
  (kill-region (region-beginning) (region-end))
  (unwind-protect
      (forward-line arg)
    (yank))
  (setq deactivate-mark nil))

(defun move-region-up (arg)
  (interactive "p")
  (unless mark-active (mark-line 1))
  (kill-region (region-beginning) (region-end))
  (unwind-protect
      (forward-line (- arg))
    (yank))
  (setq deactivate-mark nil))

(defun open-shell-pane ()
  "Open a small shell window at the bottom of the frame."
  (interactive)
  (split-window-vertically -10)
  (other-window 1)
  (shell))

(defun rotate-windows ()
  "Swap or rotate windows with their neighbors."
  (interactive)
  (let ((this-buffer (buffer-name)))
    (other-window 1)
    (let ((that-buffer (buffer-name)))
      (switch-to-buffer this-buffer)
      (other-window -1)
      (switch-to-buffer that-buffer)
      (other-window 1))))

(defun scroll-down-1 ()
  "Scroll down by a single line."
  (interactive)
  (scroll-down 1))

(defun scroll-up-1 ()
  "Scroll up by a single line."
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

;; I don't care for paredit-mode, which emacs-starter-kit enables for
;; lisp-mode by default. Redefining this function disables it.
(defun turn-on-paredit ())

;; I don't like idle-highlight either.
(remove-hook 'coding-hook 'idle-highlight)
