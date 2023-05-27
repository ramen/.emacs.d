;;; init-fonts.el --- Font configuration

(when window-system
  (let ((font
         (case window-system
           (w32 "-outline-Consolas-normal-normal-normal-*-27-*-*-*-c-*-iso10646-1")
           (ns "-apple-Monaco-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")
           (otherwise "-DAMA-Ubuntu Mono-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1"))))
    (set-face-attribute 'default nil :font font)))
