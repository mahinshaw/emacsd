(use-package tuareg
  :defer t
  :ensure t
  :init
  (add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
  (setq auto-mode-alist
        (append '(("\\.ml[ily]?$" . tuareg-mode)
                  ("\\.topml$" . tuareg-mode))
                auto-mode-alist))
  )

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

  (autoload 'setup-utop-ocaml-buffer "utop" "Toplevel for OCaml" t)
  (add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
  )

(use-package merlin
  :defer t
  :ensure t
  :init
  (after 'company
    (add-to-list 'company-backends 'merlin-company-backend))
  (add-hook 'tuareg-mode-hook 'merlin-mode)
  (setq merlin-use-auto-complete-mode 'easy)
  (setq merlin-error-after-save nil)
  )

(provide 'init-ocaml)
