;;; init-fonts.el --- Font configuration

;; https://emacs.stackexchange.com/a/36074
(defun my-dpi ()
  (let* ((attrs (car (display-monitor-attributes-list)))
         (size (assoc 'mm-size attrs))
         (sizex (cadr size))
         (res (cdr (assoc 'geometry attrs)))
         (resx (- (caddr res) (car res)))
         dpi)
    (catch 'exit
      ;; in terminal
      (unless sizex
        (throw 'exit 10))
      ;; on big screen
      (when (> sizex 1000)
        (throw 'exit 10))
      ;; DPI
      (* (/ (float resx) sizex) 25.4))))

;; laptop screen:
;; (my-dpi)141.7674418604651
;; 4k screen:
;; (my-dpi)162.56

(defun my-preferred-font-size ()
  (let ( (dpi (my-dpi)) )
  (cond
    ((< dpi 150) 14)
    (t 27))))

(defvar my-preferred-font-size (my-preferred-font-size))

(when window-system
  (let ((font
         (case window-system
           (w32 (format "-outline-Cascadia Mono-regular-normal-normal-mono-%d-*-*-*-c-*-iso10646-1" my-preferred-font-size))
           (ns "-apple-Monaco-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1")
           (otherwise "-DAMA-Ubuntu Mono-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1"))))
    (set-face-attribute 'default nil :font font)))
