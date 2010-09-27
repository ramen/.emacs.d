;;; init-fonts.el --- Font configuration

(when window-system
  (let ((font
         (case window-system
           (w32 "fixedsys")
           (mac "-apple-monaco-medium-r-normal--14-140-72-72-m-140-iso10646-1")
           (otherwise "-unknown-DejaVu Sans Mono-bold-normal-normal-*-14-*-*-*-m-0-iso10646-1"))))
    (set-face-attribute 'default nil :font font)))
