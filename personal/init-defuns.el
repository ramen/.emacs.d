;;; init-defuns.el --- Custom functions

(defun bold-all-faces ()
  "Adds bolding to all defined faces."
  (interactive)
  (mapc 'make-face-bold (face-list)))

(defun unbold-all-faces ()
  "Removes bolding from all defined faces."
  (interactive)
  (mapc 'make-face-unbold (face-list)))

(defun comment-line (arg)
  "Comment or uncomment the current line."
  (interactive "*P")
  (cond (mark-active (comment-dwim arg))
        ((= (line-beginning-position) (line-end-position)) (next-line 1))
        (t (back-to-indentation)
           (set-mark-command nil)
           (end-of-line nil)
           (comment-dwim arg)
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

(defun delete-window-and-balance ()
  (interactive)
  (delete-window)
  (if (fboundp 'window-combined-p)
      (when (window-combined-p) (balance-windows (window-parent)))
    (balance-windows)))

(defun dired-vc-log ()
  "Show a change log for the current file in a dired buffer."
  (interactive)
  (let* ((file-buffer (dired-find-file-other-window))
         (log-buffer (save-window-excursion (vc-print-log)))
         (log-window (get-buffer-window log-buffer)))
    (switch-to-buffer log-buffer)
    (kill-buffer file-buffer)
    (set-window-dedicated-p log-window t)))

(defun duplicate-line (arg)
  "Clone the current line ARG times without changing the column position."
  (interactive "p")
  (let ((col (current-column)))
    (end-of-line 1)
    (if (eobp) (open-line 1))
    (beginning-of-line 1)
    (kill-new "")
    (kill-line 1)
    (yank)
    (yank)
    (when (> arg 1)
      (save-excursion
        (dotimes (i (- arg 1)) (yank))))
    (previous-line 1)
    (move-to-column col)))

(defun extract-variable ()
  "Micro-refactoring: replace the region with a variable and save an
assignment statement in the kill ring. After calling this function, find a
good destination for the assignment and yank."
  (interactive)
  (let ((var-name (read-string "Variable name: ")))
    (kill-region (region-beginning) (region-end))
    (kill-append " = " t)
    (kill-append var-name t)
    (unless (member major-mode '(python-mode ruby-mode))
      (kill-append ";" nil))
    (insert var-name)))

(defun follow-mode-quit ()
  "Quit follow-mode without leaving extra windows around."
  (interactive)
  (delete-other-windows)
  (turn-off-follow-mode))

(defun grep-occur (regexp &optional nlines)
  "Show all lines in the current file containing a match for regexp using grep."
  (interactive (occur-read-primary-args))
  (save-some-buffers)
  (grep (concat grep-command
                (shell-quote-argument regexp)
                (if nlines
                    (if (> nlines 0)
                        (format " -C %d " nlines)
                      (format " -B %d " (abs nlines)))
                  " ")
                (buffer-file-name))))

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

(defun enlarge-first-window-horizontally (delta)
  "Like enlarge-window, but apply to the first window."
  (interactive "p")
  (with-selected-window (frame-first-window)
    (enlarge-window delta t)))

(defun insert-curlies ()
  "Insert an opening curly brace at the end of the current line, a closing
curly brace on a new line, and position the point on a new, indented line in
between."
  (interactive)
  (end-of-line nil)
  (just-one-space)
  (insert "{")
  (newline)
  (insert "}")
  (indent-according-to-mode)
  (previous-line 1)
  (end-of-line nil)
  (newline-and-indent))

(defun insert-indentation ()
  "Insert a newline and indent at the next space, like delete-indentation in
reverse."
  (interactive)
  (search-forward " ")
  (delete-horizontal-space)
  (newline-and-indent))

(defun insert-random-password (arg)
  "Insert a randomly generated password. Use a prefix argument to change the
default length of 8 characters."
  (interactive "P")
  (let ((pw-chars "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789")
        (pw-length (if arg (prefix-numeric-value arg) 8)))
    (while (> pw-length 0)
      (let ((offset (random (length pw-chars))))
        (insert (substring pw-chars offset (+ offset 1)))
        (setq pw-length (- pw-length 1))))))

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

(defun new-eshell ()
  "Open a new eshell even if one already exists."
  (interactive)
  (eshell t))

(defun new-shell ()
  "Open a new shell even if one already exists."
  (interactive)
  (shell (generate-new-buffer-name "*shell*")))

(defun open-shell-pane ()
  "Open a small shell window at the bottom of the frame."
  (interactive)
  (split-window-vertically -10)
  (other-window 1)
  (shell))

(defun other-window-reverse (count)
  (interactive "p")
  (other-window (- count)))

(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory dotfiles-dir 0)
  (dolist (dir '("core" "modules" "vendor" "personal"))
    (byte-recompile-directory (concat dotfiles-dir dir) 0)))

(defun rotate-windows (count)
  "Swap or rotate windows with their neighbors."
  (interactive "p")
  (let ((this-buffer (buffer-name)))
    (other-window count)
    (let ((that-buffer (buffer-name)))
      (switch-to-buffer this-buffer)
      (other-window (- count))
      (switch-to-buffer that-buffer)
      (other-window count))))

(defun rotate-windows-reverse (count)
  (interactive "p")
  (rotate-windows (- count)))

(defun scroll-down-1 ()
  "Scroll down by a single line."
  (interactive)
  (scroll-down 1))

(defun scroll-up-1 ()
  "Scroll up by a single line."
  (interactive)
  (scroll-up 1))

(defun shrink-first-window-horizontally (delta)
  "Like shrink-window, but apply to the first window."
  (interactive "p")
  (with-selected-window (frame-first-window)
    (shrink-window delta t)))

(defun split-window-dwim ()
  "Split window horizontally or vertically depending on space."
  (interactive)
  (select-window (if (window-splittable-p (selected-window) t)
                     (split-window-horizontally)
                   (split-window-vertically)))
  (balance-windows (and (fboundp 'window-parent) (window-parent))))

(defun start-or-end-kbd-macro ()
  "Start defining a keyboard macro, or stop if we're already defining."
  (interactive)
  (if defining-kbd-macro
      (end-kbd-macro)
    (start-kbd-macro nil)))

(defun swap-with-largest-window ()
  "Switch the buffer in the current window with that of the largest window."
  (interactive)
  (let ((current-window (selected-window))
        (current-buffer (window-buffer))
        (largest-window (get-largest-window)))
    (set-window-buffer current-window (window-buffer largest-window))
    (set-window-buffer largest-window current-buffer)
    (select-window largest-window)))

(defun textile-table (start end)
  "Convert a region of tab-delimited text to a textile-formatted table."
  (interactive "r")
  (replace-regexp "^\\|$\\|	" "|" nil start end))

(defun toggle-fullscreen ()
  (interactive)
  (if (eq window-system 'w32)
      (progn
        (require 'w32-fullscreen)
        (w32-fullscreen))
    ;; http://www.emacswiki.org/emacs/FullScreen
    (let ((current-value (frame-parameter nil 'fullscreen)))
      (set-frame-parameter nil 'fullscreen
                           (if (equal 'fullboth current-value)
                               (if (boundp 'old-fullscreen) old-fullscreen nil)
                             (progn (setq old-fullscreen current-value)
                                    'fullboth))))))

(defun toggle-maximized ()
  (interactive)
  (cond ((window-parent)
         (setq unmaximized-window-configuration (current-window-configuration))
         (delete-other-windows))
        ((boundp 'unmaximized-window-configuration)
         (set-window-configuration unmaximized-window-configuration))))

(defun toggle-show-trailing-whitespace ()
  "Toggles the highlighting of trailing whitespace."
  (interactive)
  (set-variable 'show-trailing-whitespace (not show-trailing-whitespace)))

(defun toggle-text-mode-fontified ()
  "Toggles text-mode while preserving fontification."
  (interactive)
  (if (eq major-mode 'text-mode)
      (if (boundp 'last-major-mode)
          (funcall last-major-mode))
    (flet ((font-lock-change-mode () ()))
      (setq last-major-mode major-mode)
      (text-mode))))

;; I don't like idle-highlight-mode.
(remove-hook 'prog-mode-hook 'idle-highlight-mode)

;; I use global-hl-line-mode.
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)

;; Don't use auto-fill by default in text modes.
(remove-hook 'text-mode-hook 'turn-on-auto-fill)
