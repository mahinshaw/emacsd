;; Settings for smartparens

(require-package 'smartparens)
(require-package 'evil-smartparens)
(require 'smartparens)
(require 'evil-smartparens)
;; default settings for smartparens
(require 'smartparens-config)

(after 'evil
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))

(setq sp-show-pair-from-inside t)

;; turn smartparens on everywhere
(smartparens-global-mode t)

(show-smartparens-global-mode t)
(sp-use-smartparens-bindings)

(add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
(add-hook 'clojure-mode-hook 'smartparens-strict-mode)

(after 'evil
  (evil-define-key 'normal sp-keymap
    (kbd ">s") 'sp-forward-sexp
    (kbd "<s") 'sp-backward-sexp
    (kbd ">y") 'sp-forward-slurp-sexp
    (kbd "<y") 'sp-backward-slurp-sexp
    (kbd ">d") 'sp-forward-barf-sexp
    (kbd "<d") 'sp-backward-barf-sexp
    (kbd "C-(") 'sp-beginning-of-sexp
    (kbd "C-)") 'sp-end-of-sexp
    ))

(provide 'init-smartparens)
