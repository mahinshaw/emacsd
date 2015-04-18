;; Config for projectile plugin
(use-package helm-projectile
  :ensure t
  :init
  (helm-projectile-on))

(use-package projectile
  :ensure t
  :init
  (require 'helm-projectile)
  (projectile-global-mode)
  (setq projectile-enable-caching t
        projectile-switch-project-action 'projectile-dired
        projectile-completion-system 'helm))

(provide 'init-projectile)
