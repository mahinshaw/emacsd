;; This file contains utility functions.

;; Am I using a mac?
(setq is-mac (equal system-type 'darwin))

;; Am I using Window? (only because I have to at work.
(setq is-windows (equal system-type 'windows-nt))

;; Macro for loading after another package has been loaded
;; with-eval-after-load does not require a single command, or a '(progn)
(if (fboundp 'with-eval-after-load)
    (defmacro after (feature &rest body)
      "After FEATURE is loaded, evaluate BODY."
      (declare (indent defun))
      `(with-eval-after-load ,feature ,@body))
  ;; if with-eval-after-load doesn't exist, use eval-after-load,
  ;; and wrap body, in a progn.
  (defmacro after (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))
    
(provide 'init-utils)
