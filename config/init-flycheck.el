;; Flycheck related configs.
(require-package 'flycheck)
(require 'flycheck)
(diminish 'flycheck-mode)

(add-hook 'after-init-hook 'global-flycheck-mode)

(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

(provide 'init-flycheck)
