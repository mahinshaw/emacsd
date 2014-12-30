;; Setup for ag
(require-package 'ag)
(require 'ag)

(setq ag-highlight-search t)
(setq ag-reuse-buffers 't) ;; reuse the same buffer for ag output.

(provide 'init-ag)
