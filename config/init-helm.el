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

    (global-set-key (kbd "C-x b") 'helm-mini)

    (when (executable-find "curl")
      (setq helm-google-suggest-use-curl-p t))
    
    (setq helm-split-window-in-side-p t
          helm-quick-update t
          helm-bookmark-show-location t
          helm-apropos-fuzzy-match t
          helm-buffers-fuzzy-matching t
          helm-M-x-fuzzy-match t
          helm-recentf-fuzzy-match t
          helm-semantic-fuzzy-match t
          helm-imenu-fuzzy-match t
          helm-locate-fuzzy-match t)

    (helm-mode 1))
  :bind (("M-x" . helm-M-x)
         ("<tab>" . helm-execute-persistent-action)
         ("C-z" . helm-select-action)
         ("C-f" . helm-next-page)
         ("C-b" . helm-previous-page)
         ("C-M-f" . helm-scroll-other-window)
         ("C-M-b" . helm-scroll-other-window-down)))

(provide 'init-helm)
