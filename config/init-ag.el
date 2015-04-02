;; Setup for ag
(use-package ag
  :ensure t
  :init
  (setq ag-highlight-search t
        ag-reuse-buffers t)) ;; reuse the same buffer for ag output.

(provide 'init-ag)
