;; Flycheck related configs.
(require-package 'flycheck)
(require 'flycheck)

(add-hook 'after-init-hook 'global-flycheck-mode)

(provide 'init-flycheck)
