;; Settings for smartparens

(require-package 'smartparens)
(require 'smartparens)
;; default settings for smartparens
(require 'smartparens-config)

(setq sp-show-pair-from-inside t)

;; turn smartparens on everywhere
(smartparens-global-mode t)

(show-smartparens-global-mode t)
(sp-use-smartparens-bindings)

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
