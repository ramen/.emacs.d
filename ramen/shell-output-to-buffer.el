;;; shell-output-to-buffer.el --- Always send shell output to a buffer

;; Normally, output from commands like shell-command-on-region go either to
;; the echo area or a buffer depending the size of the output. I prefer my
;; output in a buffer every time so that I can edit it, even if it is small.

;; Redefine display-message-or-buffer so that it always uses a buffer.
(defun display-message-or-buffer (message &optional buffer-name not-this-window frame)
  "Display MESSAGE in a pop-up buffer. MESSAGE may be either a string or a buffer."
  (with-current-buffer
      (if (bufferp message)
          message
        (get-buffer-create (or buffer-name "*Message*")))
    (unless (bufferp message)
      (erase-buffer)
      (insert message))
    (goto-char (point-min))
    (display-buffer (current-buffer) not-this-window frame)))
