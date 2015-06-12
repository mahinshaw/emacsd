(use-package tuareg
  :defer t
  :ensure t
  :init
  (add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
  (setq auto-mode-alist
        (append '(("\\.ml[ily]?$" . tuareg-mode)
                  ("\\.topml$" . tuareg-mode))
                auto-mode-alist)))

(use-package utop
  :defer t
  :ensure t
  :init
  ;; Setup environment variables using opam
  (dolist (var (car (read-from-string (shell-command-to-string "opam config env --sexp"))))
    (setenv (car var) (cadr var)))

  ;; Update the emacs path
  (setq exec-path (append (parse-colon-path (getenv "PATH"))
                          (list exec-directory)))

  (add-hook 'tuareg-mode-hook 'utop-minor-mode)

  :config
  (after 'evil
    (evil-define-key 'normal merlin-mode-map
      ;;Evaluate the current toplevel form. PREFIX => print in buffer.
      (kbd "<return>") 'utop-eval-phrase
      (kbd "g X") 'utop-eval-buffer)
    (evil-define-key 'visual merlin-mode-map
      (kbd "<return>") 'utop-eval-region)))

(use-package merlin
  :defer t
  :ensure t
  :init
  (after 'company
    (add-to-list 'company-backends 'merlin-company-backend))
  (add-hook 'tuareg-mode-hook 'merlin-mode)
  (setq merlin-error-after-save nil)

  :config
  (after 'evil
    (evil-define-key 'normal merlin-mode-map
      (kbd "g d") 'merlin-locate
      (kbd "C-]") 'merlin-locate)))

(provide 'init-ocaml)
