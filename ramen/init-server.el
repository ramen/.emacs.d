;;; init-server.el --- Start Emacs server if not running already

(when window-system
  (let ((warning-minimum-level :error))
    (server-start)))
