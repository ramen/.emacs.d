;;; init-colors.el --- Color scheme configuration

(require 'color-theme)
(require 'color-theme-tango-2)
(color-theme-tango-2)

(defun set-opacity ()
  "Set opacity of current window"
  (interactive)
  (let ((opacity (read-number "Opacity: ")))
    (set-frame-parameter (selected-frame) 'alpha (list opacity opacity))))

(global-hl-line-mode 1)
(set-face-background 'hl-line "gray10")

(add-hook 'erc-mode-hook
          (lambda ()
            (make-local-variable 'global-hl-line-mode)
            (setq global-hl-line-mode nil)
            (set-face-foreground 'erc-input-face "#fcaf3e")
            (set-face-foreground 'erc-nick-default-face "#729fcf")
            (set-face-foreground 'erc-timestamp-face "gray30")))

(add-hook 'js2-mode-hook
          (lambda ()
            (set-face-foreground 'js2-external-variable "#ff0000")
            (set-face-foreground 'js2-function-param "#fce94f")))

(add-hook 'speedbar-mode-hook
          (lambda ()
            (set-face-background 'speedbar-highlight-face "#444444")
            (set-face-background 'speedbar-separator-face "#2e3436")
            (set-face-foreground 'speedbar-button-face "#888a85")
            (set-face-foreground 'speedbar-directory-face "#729fcf")
            (set-face-foreground 'speedbar-file-face "#eeeeec")
            (set-face-foreground 'speedbar-selected-face "#73d216")
            (set-face-foreground 'speedbar-tag-face "#ad7fa8")))

(add-hook 'tuareg-mode-hook
          (lambda ()
            (set-face-foreground 'tuareg-font-lock-operator-face "gray30")))

(eval-after-load 'which-func
  '(set-face-foreground 'which-func "white"))

(set-face-background 'show-paren-match "gray30")
(setq vc-annotate-background "unspecified")

;; http://www.emacswiki.org/emacs/FlyMake#toc17
(custom-set-faces
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "orange"))))
 '(js2-error ((((class color)) (:underline "red"))))
 '(js2-warning ((((class color)) (:underline "orange")))))

(when window-system
  ;; Fancy color map for shell-mode, etc.
  (setq ansi-color-names-vector
        ["#eeeeec" "#ff0000" "#458b00" "#f57900"
         "#729fcf" "#6255bc" "#00ffff" "#888a85"])
  (setq ansi-color-map (ansi-color-make-color-map))

  ;; OSX clobbers this for some reason.
  (set-face-background 'region "#555753"))

(unless window-system
  (add-hook 'dired-mode-hook
            (lambda ()
              (set-face-foreground 'dired-header "yellow")
              (set-face-foreground 'dired-ignored "gray")))
  (make-face-bold 'default)
  (make-face-unbold 'font-lock-type-face)
  (make-face-unbold 'font-lock-warning-face)
  (make-face-unbold 'ido-only-match)
  (make-face-unbold 'isearch)
  (set-face-background 'highlight "gray")
  (set-face-background 'isearch "yellow")
  (set-face-background 'mode-line "gray")
  (set-face-background 'region "gray")
  (set-face-background 'show-paren-match "gray")
  (set-face-background 'show-paren-mismatch "red")
  (set-face-foreground 'default "black")
  (set-face-foreground 'esk-paren-face "white")
  (set-face-foreground 'font-lock-builtin-face "blue")
  (set-face-foreground 'font-lock-comment-delimiter-face "white")
  (set-face-foreground 'font-lock-comment-face "white")
  (set-face-foreground 'font-lock-function-name-face "blue")
  (set-face-foreground 'font-lock-preprocessor-face "blue")
  (set-face-foreground 'font-lock-string-face "green")
  (set-face-foreground 'font-lock-variable-name-face "black")
  (set-face-foreground 'isearch "black")
  (set-face-foreground 'isearch-lazy-highlight-face "black")
  (set-face-foreground 'match "black")
  (set-face-foreground 'minibuffer-prompt "blue")
  (set-face-foreground 'mode-line "black")
  (set-face-foreground 'show-paren-match "black")
  (set-face-foreground 'show-paren-mismatch "white"))
