;;; init-misc.el --- Things that don't fit anywhere else

(blink-cursor-mode 1)
(column-number-mode 1)
(delete-selection-mode 1)
(winner-mode 1)

(if (fboundp 'tooltip-mode) (tooltip-mode 1))

(setenv "PAGER" "cat")

(mapc (lambda (cmd) (put cmd 'disabled nil))
      '(downcase-region
        upcase-region
        narrow-to-page
        narrow-to-region
        scroll-left))

(setq auto-save-default nil
      bs-alternative-configuration "files"
      bs-default-configuration "all"
      compilation-scroll-output 'first-error
      grep-command "grep -nHP -e "
      grep-find-template "find . <X> -type f <F> -exec grep <C> -nHP -e <R> {} /dev/null \\;"
      grep-template "grep <C> -nHP -e <R> <F>"
      ido-ubiquitous-command-exceptions '(describe-function
                                          describe-variable
                                          execute-extended-command)
      ido-use-filename-at-point nil
      initial-scratch-message nil
      line-move-visual nil
      mark-even-if-inactive t
      mode-line-in-non-selected-windows nil
      parens-require-spaces nil
      ring-bell-function 'ignore
      scroll-error-top-bottom t
      scroll-preserve-screen-position t
      sentence-end-double-space nil
      split-width-threshold 140
      tramp-default-method "sshx"
      uniquify-buffer-name-style 'post-forward-angle-brackets
      which-func-modes t
      window-combination-resize t)

(setq-default fill-column 78)
