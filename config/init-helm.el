;; This contains settings for Helm.
(use-package helm
  :defer t
  :ensure t
  :init
  (progn
    (require 'helm)
    (require 'helm-config)
    ;; (require 'helm-misc)

    (global-set-key (kbd "C-c h") 'helm-command-prefix)
    (global-unset-key (kbd "C-x c"))

    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-z") 'helm-select-action)

    (when (executable-find "curl")
      (setq helm-google-suggest-use-curl-p t))
    
    (setq helm-split-window-in-side-p t
          helm-quick-update t
          helm-bookmark-show-location t
          helm-buffers-fuzzy-matching t)

    (helm-mode 1))
  :bind (("M-x" . helm-M-x)))

;; (require 'helm-projectile)
;; (require 'helm-locate)

(provide 'init-helm)
