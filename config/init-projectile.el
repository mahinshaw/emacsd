;; Config for projectile plugin
(require-package 'projectile)
(require 'projectile)

;; enable where possible
(projectile-global-mode)

;; enable projectile caching
(setq projectile-enable-caching t)

;; set switch action to use dired.
(setq projectile-switch-project-action 'projectile-dired)

(provide 'init-projectile)
