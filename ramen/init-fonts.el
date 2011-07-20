;;; init-fonts.el --- Font configuration

(when window-system
  (let ((font
         (case window-system
           (w32 "-outline-Fixedsys Excelsior 3.01-normal-normal-normal-sans-16-*-*-*-c-*-iso10646-1")
           (ns "-apple-Menlo-medium-normal-normal-*-15-*-*-*-m-0-iso10646-1")
           (otherwise "-unknown-DejaVu Sans Mono-bold-normal-normal-*-14-*-*-*-m-0-iso10646-1"))))
    (set-face-attribute 'default nil :font font)))
