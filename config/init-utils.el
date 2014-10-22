;; This file contains utility functions.

;; Am I using a mac?
(setq is-mac (equal system-type 'darwin))

;; Am I using Window? (only because I have to at work.
(setq is-windows (equal system-type 'windows-nt))

;; Macro for loading after another package has been loaded
(if (fboundp 'with-eval-after-load)
    (defmacro after (feature &rest body)
      "After FEATURE is loaded, evaluate BODY."
      (declare (indent defun))
      '(with-eval-after-load ,feature ,@body))
  (defmacro after (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))
    
(provide 'init-utils)
