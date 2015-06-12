;;; init-utils --- Utility functions.
;;; Commentary:
;;; Code:
;; Am I using a mac?
(setq is-mac (equal system-type 'darwin))

;; Am I using Window? (only because I have to at work.
(setq is-windows (equal system-type 'windows-nt))

(setq is-linux (equal system-type 'gnu/linux))

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

;; http://emacs-fu.blogspot.com/2008/12/running-some-external-program-only-if.html
(defun util-shell-command-maybe (exe &optional paramstr)
  "run executable EXE with PARAMSTR, or warn if EXE's not available; eg. "
  " (util-shell-command-maybe \"ls\" \"-l -a\")"
  (if (executable-find exe)
    (shell-command (concat exe " " paramstr))
    (message (concat "'" exe "' not found found; please install"))))

(provide 'init-utils)
;;; init-utils ends here
