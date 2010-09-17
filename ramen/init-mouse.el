;;; init-mouse-el --- Mouse configuration

;; Make mouse wheel scroll one line at a time.
(setq mouse-wheel-progressive-speed nil
      mouse-wheel-scroll-amount '(1))

;; ctrl-wheel to zoom font size
(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)

;; MX Revolution mouse features
(global-set-key [mouse-8] 'winner-undo)
(global-set-key [mouse-9] 'winner-redo)
(global-set-key [mouse-13] 'bs-cycle-previous)
(global-set-key [mouse-15] 'bs-cycle-next)
(global-set-key [mouse-17] 'last-buffer)
