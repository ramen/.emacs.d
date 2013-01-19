;;; init-rect-mark.el --- Visual rectangular selection

(define-key ctl-x-map "r\C-@" 'rm-set-mark)
(define-key ctl-x-map [?r ?\C-\ ] 'rm-set-mark)
(define-key ctl-x-map "r\C-x" 'rm-exchange-point-and-mark)
(define-key ctl-x-map "r\C-w" 'rm-kill-region)
(define-key ctl-x-map "r\M-w" 'rm-kill-ring-save)
(define-key ctl-x-map "r\C-y" 'yank-rectangle)
(define-key global-map [S-down-mouse-1] 'rm-mouse-drag-region)
(define-key global-map [S-mouse-2] (lambda (start-event)
                                     (interactive "e")
                                     (mouse-set-point start-event)
                                     (yank-rectangle)))

(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)
