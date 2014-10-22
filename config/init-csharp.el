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

(if is-windows
    (setq omnisharp--curl-executable-path "C:/Program Files (x86)/Git/bin/curl.exe"
          omnisharp-server-executable-path "C:/Users/Mark/workspace/omnisharpserver/OmniSharp/bin/Debug/OmniSharp.exe"))

(require 'company)
(setq company-mode 1)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-omnisharp))

(add-hook 'csharp-mode-hook 'omnisharp-mode)

(provide 'init-csharp)
