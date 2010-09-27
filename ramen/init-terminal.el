;;; init-terminal.el --- Terminal emulator support

(unless window-system
  (define-key key-translation-map (kbd "ESC <f1>") (kbd "<M-f1>"))
  (define-key key-translation-map (kbd "ESC <f2>") (kbd "<M-f2>"))
  (define-key key-translation-map (kbd "ESC <f3>") (kbd "<M-f3>"))
  (define-key key-translation-map (kbd "ESC <f4>") (kbd "<M-f4>"))
  (define-key key-translation-map (kbd "ESC <f5>") (kbd "<M-f5>"))
  (define-key key-translation-map (kbd "ESC <f6>") (kbd "<M-f6>"))
  (define-key key-translation-map (kbd "ESC <f7>") (kbd "<M-f7>"))
  (define-key key-translation-map (kbd "ESC <f8>") (kbd "<M-f8>"))
  (define-key key-translation-map (kbd "ESC <f9>") (kbd "<M-f9>"))
  (define-key key-translation-map (kbd "ESC <f10>") (kbd "<M-f10>"))
  (define-key key-translation-map (kbd "ESC <f11>") (kbd "<M-f11>"))
  (define-key key-translation-map (kbd "ESC <f12>") (kbd "<M-f12>"))
  (define-key key-translation-map (kbd "ESC C-@") (kbd "C-M-SPC"))
  (define-key key-translation-map (kbd "ESC O 3 a") (kbd "<M-up>"))
  (define-key key-translation-map (kbd "ESC O 3 b") (kbd "<M-down>"))
  (define-key key-translation-map (kbd "ESC O 3 c") (kbd "<M-right>"))
  (define-key key-translation-map (kbd "ESC O 3 d") (kbd "<M-left>"))
  (define-key key-translation-map (kbd "ESC O a") (kbd "<C-up>"))
  (define-key key-translation-map (kbd "ESC O b") (kbd "<C-down>"))
  (define-key key-translation-map (kbd "ESC O c") (kbd "<C-right>"))
  (define-key key-translation-map (kbd "ESC O d") (kbd "<C-left>"))
  (define-key key-translation-map (kbd "ESC [ 7 ^") (kbd "<C-home>"))
  (define-key key-translation-map (kbd "ESC [ 8 ^") (kbd "<C-end>"))
)
