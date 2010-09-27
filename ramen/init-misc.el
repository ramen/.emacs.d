;;; init-misc.el --- Things that don't fit anywhere else

(blink-cursor-mode 1)
(delete-selection-mode 1)
(winner-mode 1)

(setq auto-save-default nil
      initial-scratch-message nil
      line-move-visual nil
      mark-even-if-inactive t
      mode-line-in-non-selected-windows nil
      parens-require-spaces nil
      ring-bell-function 'ignore
      scroll-preserve-screen-position t
      sentence-end-double-space nil
      tramp-default-method "ssh"
      uniquify-buffer-name-style 'post-forward-angle-brackets)

(setq-default fill-column 78)
