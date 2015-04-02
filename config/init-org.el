;;; init-org --- Org-Mode configs
;;; Commentary:
;;; Code:
(use-package org
  :init (setq org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE"))))

;; Make org-mode work with files ending in .org
;; (add-to-list) 'auto-mode-alist '("\\.org$" . org-mode))
;; The above list is the default in recent emacsen

(provide 'init-org)
;;; init-org.el ends here
