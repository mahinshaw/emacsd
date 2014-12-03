;; Company-mode completes for me.
;; Mode specific backends are handled within the specific init-*.
(require-package 'company)
(require 'company)
(diminish 'company-mode)

;; run company-mode everywhere
(add-hook 'after-init-hook 'global-company-mode)
(after 'evil
  (define-key evil-insert-state-map (kbd "C-p") 'company-select-previous)
  (define-key evil-insert-state-map (kbd "C-n") 'company-select-next)
  )

(provide 'init-company)
