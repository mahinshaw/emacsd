;; Settings for smartparens

(require-package 'smartparens)
(require-package 'evil-smartparens)
(use-package smartparens
  :defer t
  :ensure t
  :init
  ;; default settings for smartparens
  (require 'smartparens-config)

  (setq sp-show-pair-from-inside t)

  ;; turn smartparens on everywhere
  (smartparens-global-mode t)

  (show-smartparens-global-mode t)
  (sp-use-smartparens-bindings)

  (add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
  (add-hook 'clojure-mode-hook 'smartparens-strict-mode)
  :config
  (after 'evil
    (evil-define-key 'normal sp-keymap
      (kbd "> )") 'sp-forward-slurp-sexp
      (kbd "<SPC> f s") 'sp-forward-slurp-sexp
      (kbd "< (") 'sp-backward-slurp-sexp
      (kbd "<SPC> b s") 'sp-backward-slurp-sexp
      (kbd "> (") 'sp-forward-barf-sexp
      (kbd "<SPC> f b") 'sp-forward-barf-sexp
      (kbd "< )") 'sp-backward-barf-sexp
      (kbd "<SPC> b b") 'sp-backward-barf-sexp
      (kbd "C-(") 'sp-beginning-of-sexp
      (kbd "C-)") 'sp-end-of-sexp
      )))



(use-package evil-smartparens
  :ensure t
  :init
  (after 'evil
    (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)))

(provide 'init-smartparens)
