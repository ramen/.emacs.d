;;; init-mouse-el --- Mouse configuration

;; Make mouse wheel scroll one line at a time.
(setq mouse-wheel-progressive-speed nil
      mouse-wheel-scroll-amount '(1))

;; ctrl-wheel to zoom font size
(if (eq window-system 'w32)
    (progn
      (global-set-key [C-wheel-up] 'text-scale-increase)
      (global-set-key [C-wheel-down] 'text-scale-decrease))
  (global-set-key [C-mouse-4] 'text-scale-increase)
  (global-set-key [C-mouse-5] 'text-scale-decrease))

;; back and next buttons for winner-mode
(if (eq window-system 'w32)
    (progn
      (global-set-key [mouse-4] 'winner-undo)
      (global-set-key [mouse-5] 'winner-redo))
  (global-set-key [mouse-8] 'winner-undo)
  (global-set-key [mouse-9] 'winner-redo))

;; MX Revolution mouse features
(global-set-key [mouse-13] 'bs-cycle-previous)
(global-set-key [mouse-15] 'bs-cycle-next)
(global-set-key [mouse-17] 'last-buffer)
