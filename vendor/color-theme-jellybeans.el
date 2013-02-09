;;; color-theme-jellybeans.el --- Jellybeans Colortheme

;; Copyright (C) 2011  Christopher Giroir

;; Author: Christopher Giroir <cgiroir@berklee.edu>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Porting the jellybeans color theme to emacs

;;; Code:

;;;###autoload
(defun color-theme-jellybeans ()
  (interactive)
  (color-theme-install
   '(color-theme-jellybeans
     ((background-color . "#151515")
      (background-mode . dark)
      (border-color . "#1c1c1c")
      (cursor-color . "#b0d0f0")
      (foreground-color . "#e8e8d3")
      (mouse-color . "#151515"))
     (fringe ((t (:background "#1c1c1c"))))
     (mode-line ((t (:foreground "#000000" :background "#dddddd"))))
     (region ((t (:background "#404040"))))
     (font-lock-builtin-face ((t (:foreground "#8fbfdc"))))
     (font-lock-constant-face ((t (:foreground "#8197bf"))))
     (font-lock-comment-face ((t (:foreground "#888888"))))
     (font-lock-function-name-face ((t (:foreground "#fad07a"))))
     (font-lock-keyword-face ((t (:foreground "#8fbfdc"))))
     (font-lock-string-face ((t (:foreground "#99ad6a"))))
     (font-lock-type-face ((t (:foreground"#ffb964"))))
     (font-lock-variable-name-face ((t (:foreground "#cf6a4c"))))
     (font-lock-preprocessor-face ((t (:foreground "#8fbfdc"))))
     (trailing-whitespace ((t (:background "#252525"))))
     (minibuffer-prompt ((t (:foreground "#8fbfdc" :bold t))))
     (highlight ((t (:background "#1c1c1c"))))
     (hl-line ((t (:background "#1c1c1c"))))
     (show-paren-match ((t (:foreground "#ffffff" :background "#80a090"))))
     (font-lock-warning-face ((t (:foreground "#902020" :bold t)))))))

(provide 'color-theme-jellybeans)
;;; color-theme-jellybeans.el ends here
