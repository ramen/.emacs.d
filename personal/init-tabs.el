;;; init-tabs.el --- Tab settings and helper functions

(defun make-tab-stop-list (width max)
  "Build a tab stop list for a given tab width and maximum line width"
  (let ((i width) list)
    (while (<= i max)
      (setq list (cons i list)
            i (+ i width)))
    (nreverse list)))

(defun set-tabs-local (width use-tabs)
  "Set local tab width and whether or not tab characters should be used"
  (setq indent-tabs-mode use-tabs)
  (setq tab-stop-list (make-tab-stop-list width 80))
  (dolist (var '(c-basic-offset css-indent-offset css-indent-level
                 espresso-indent-level javascript-indent-level js-indent-level
                 lua-indent-level python-indent py-indent-offset rust-indent-unit
                 sgml-basic-offset sh-basic-offset zencoding-indentation
                 standard-indent tab-width))
    (set var width)))

(defun make-tabs-global ()
  "Make current local tab settings the default"
  (interactive)
  (setq-default indent-tabs-mode indent-tabs-mode)
  (setq-default tab-stop-list tab-stop-list)
  (setq-default tab-width tab-width))

(defun set-tabs ()
  "Configure tab settings for this buffer"
  (interactive)
  (set-tabs-local
   (- (read-char "Tab width: ") ?0)
   (y-or-n-p "Use tab character? "))
  (if (y-or-n-p "Make settings global? ")
      (make-tabs-global))
  (message nil))

(set-tabs-local 4 nil)
(make-tabs-global)
