;; This contains settings for Helm.

(require-package helm)
(require 'helm-config)
(require 'helm-misc)
;; (require 'helm-projectile)
(require 'helm-locate)

(setq helm-quick-update t
      helm-bookmark-show-location t
      helm-buffers-fuzzy-matching t)

(global-set-key (kbd "M-x") 'helm-M-x)

(provide 'init-helm)
