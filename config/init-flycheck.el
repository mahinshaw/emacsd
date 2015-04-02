;; Flycheck related configs.
(use-package flycheck
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  :diminish flycheck-mode)

(provide 'init-flycheck)
