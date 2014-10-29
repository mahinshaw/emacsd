;;; init-misc.el --- Miscellaneous stuff
;;; Commentary:
;; This init file contains packages/settings that do not require their own file.
;;; Code:
;; Aggressive-indent
(require-package 'aggressive-indent)
(require 'aggressive-indent)
(global-aggressive-indent-mode)

;; elisp slime nav mode
(require 'elisp-slime-nav)
;; When entering emacs-lisp-mode, use elisp-slime-nav-mode and eldoc-mode.
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (elisp-slime-nav-mode)
            (eldoc-mode)))

(provide 'init-misc)
;;; init-misc.el ends here
