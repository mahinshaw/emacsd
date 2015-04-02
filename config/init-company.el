;; Company-mode completes for me.
;; Mode specific backends are handled within the specific init-*.
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (after 'evil
    (define-key evil-insert-state-map (kbd "C-p") 'company-select-previous)
    (define-key evil-insert-state-map (kbd "C-n") 'company-select-next))
  :diminish company-mode)

;; run company-mode everywhere

(provide 'init-company)
