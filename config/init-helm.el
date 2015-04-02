;; This contains settings for Helm.
(use-package helm
  :ensure t
  :init
  (progn
    (require 'helm-config)
    (require 'helm-misc)
    (setq helm-quick-update t
          helm-bookmark-show-location t
          helm-buffers-fuzzy-matching t)
    (helm-mode 1))
  :bind (("M-x" . helm-M-x)))

;; (require 'helm-projectile)
;; (require 'helm-locate)

(provide 'init-helm)
