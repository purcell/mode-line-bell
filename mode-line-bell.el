;;; mode-line-bell.el --- Flash the mode line instead of ringing the bell  -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Case Duckworth
;; Copyright (C) 2018  Steve Purcell

;; Author: Steve Purcell <steve@sanityinc.com>
;; Author: Case Duckworth <acdw@acdw.net>
;; Keywords: convenience
;; URL: https://github.com/duckwork/mode-line-bell
;; Package-Version: 0.2
;; Package-Requires: ((emacs "26.2"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Enable the global minor mode `mode-line-bell-mode' to set
;; `ring-bell-function' to a function that will briefly flash the mode
;; line when the bell is rung.

;;; Code:

(defgroup mode-line-bell nil
  "Flash the mode line instead of ringing the bell."
  :group 'frames)

(defcustom mode-line-bell-flash-time 0.05
  "Length of time to flash the mode line when the bell is rung."
  :type 'float
  :safe 'floatp)

(defvar mode-line-bell--flashing nil
  "If non-nil, the mode line is currently flashing.")

(defvar mode-line-bell--inverted nil
  "Whether the mode-line-bell face has been inverted.")

(defface mode-line-bell '((t :inherit mode-line
                             :inverse-video t))
  "The mode-line face during `mode-line-bell-flash'.")

(defun mode-line-bell--remap ()
  "Remap the mode-line face to mode-line-bell."
  (add-to-list 'face-remapping-alist '(mode-line . mode-line-bell)))

(defun mode-line-bell--unremap ()
  "Reset the mode-line to the original face."
  (setq  face-remapping-alist
         (assoc-delete-all 'mode-line face-remapping-alist))
  (force-mode-line-update t))

(defun mode-line-bell--begin-flash ()
  "Begin flashing the mode line."
  (unless mode-line-bell--flashing
    (mode-line-bell--remap)
    (setq mode-line-bell--flashing t))
  (force-mode-line-update))

(defun mode-line-bell--end-flash ()
  "Finish flashing the mode line."
  (when mode-line-bell--flashing
    (mode-line-bell--unremap)
    (setq mode-line-bell--flashing nil))
  (force-mode-line-update))

;;;###autoload
(defun mode-line-bell-flash ()
  "Flash the mode line momentarily."
  (unless mode-line-bell--flashing
    (run-with-timer mode-line-bell-flash-time nil 'mode-line-bell--end-flash)
    (mode-line-bell--begin-flash)))

;;;###autoload
(define-minor-mode mode-line-bell-mode
  "Flash the mode line instead of ringing the bell."
  :lighter nil
  :global t
  (setq-default ring-bell-function (when mode-line-bell-mode
                                     'mode-line-bell-flash))
  (if mode-line-bell-mode
      (add-function :after after-focus-change-function
                    #'mode-line-bell--unremap)
    (remove-function after-focus-change-function
                     #'mode-line-bell--unremap)))


(provide 'mode-line-bell)
;;; mode-line-bell.el ends here
