;; I have to use C# at work, so I might as well use it with emacs.

;; csharp-mode
(use-package csharp-mode
  :defer t
  :ensure t
  :init
  (setq csharp-want-imenu nil)
  )

;; omnisharp-emacs
(use-package omnisharp
  :ensure t
  :defer t
  :bind (("C-c M-j" . omnisharp-start-omnisharp-server)
         ("C-c C-q" . omnisharp-stop-server))
  :init
  (setq omnisharp-server-executable-path "~/workspace/OmniSharpServer/OmniSharp/bin/Debug/OmniSharp.exe"
   omnisharp-imenu-support t)
  :config
  (after 'company
    '(add-to-list 'company-backends 'company-omnisharp))
  (add-hook 'csharp-mode-hook 'omnisharp-mode)
  ;; evil-mode mappings
  ;; Take from sample @github.com/omnisharp/omnisharp-emacs
  (after 'evil
    ;; Insert mappings
    (evil-define-key 'insert omnisharp-mode-map (kbd "M-.") 'omnisharp-auto-complete)
    (evil-define-key 'insert omnisharp-mode-map (kbd ".") 'omnisharp-add-dot-and-auto-complete)
    (evil-define-key 'insert omnisharp-mode-map (kbd "<f12>") 'omnisharp-show-last-auto-complete-result)

    ;; Normal mappings
    (evil-define-key 'normal omnisharp-mode-map (kbd "g d") 'omnisharp-go-to-definition) ;; no need for tags here.
    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC o u") 'omnisharp-helm-find-usages)
    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC o s") 'omnisharp-helm-find-symbol)
    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC o I") 'omnisharp-find-implementations) ; g i is taken
    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC o R") 'omnisharp-run-code-action-refactoring)
    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC o f") 'omnisharp-fix-code-issue-at-point)
    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC o F") 'omnisharp-fix-usings)
    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC o r") 'omnisharp-rename)
    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC o t") 'omnisharp-current-type-information)
    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC o T") 'omnisharp-current-type-documentation)
    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC n t") 'omnisharp-navigate-to-current-file-member)
    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC n s") 'omnisharp-navigate-to-solution-member)
    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC n f") 'omnisharp-navigate-to-solution-file-then-file-member)
    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC n F") 'omnisharp-navigate-to-solution-file)
    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC n r") 'omnisharp-navigate-to-region)
    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC .") 'omnisharp-show-overloads-at-point)
    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC rc") 'recompile)
    (evil-define-key 'normal omnisharp-mode-map (kbd "<f12>") 'omnisharp-show-last-auto-complete-result)

    ;; run tests
    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC rt")
      (lambda() (interactive) (omnisharp-unit-test "single")))

    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC rf")
      (lambda() (interactive) (omnisharp-unit-test "fixture")))

    (evil-define-key 'normal omnisharp-mode-map (kbd "SPC ra")
      (lambda() (interactive) (omnisharp-unit-test "all"))))

  :diminish omnisharp-mode)


;; Speed up auto-complete on mono drastically. This comes with the
;; downside that documentation is impossible to fetch.
;; (setq omnisharp-auto-complete-want-documentation nil))

(provide 'init-csharp)
