(require-package 'paredit)
(require-package 'evil-paredit)

(after 'paredit
  (diminish 'paredit-mode "Par"))

(add-hook 'emacs-lisp-mode-hook #'paredit-mode)
(add-hook 'ielm-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'scheme-mode-hook #'paredit-mode)

(after 'evil
  (add-hook 'emacs-lisp-mode-hook #'evil-paredit-mode)
  ;; (add-hook 'cider-repl-mode-hook #'evil-paredit-mode)
  (add-hook 'clojure-mode-hook #'evil-paredit-mode)
  (add-hook 'scheme-mode-hook #'evil-paredit-mode))

(provide 'init-paredit)
