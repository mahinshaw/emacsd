;; I have to use C# at work, so I might as well use it with emacs.

;; csharp-mode
(require-package 'csharp-mode)
(require 'csharp-mode)
(setq csharp-want-imenu nil)
(local-set-key (kbd "{") 'csharp-insert-open-brace)

;; omnisharp-emacs
;; (require-package 'company-mode)
(require-package 'omnisharp)
(require 'omnisharp)

;; add company-mode completion backend.
(after 'company
  '(add-to-list 'company-backends 'company-omnisharp))

(add-hook 'csharp-mode-hook 'omnisharp-mode)

(provide 'init-csharp)
