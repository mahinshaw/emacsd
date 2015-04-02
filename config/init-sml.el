(use-package smart-mode-line
  :ensure t
  :init
  (sml/setup)
  (sml/apply-theme 'respectful)

  ;; Directory shortnames => apply them in order so that they are reusable
  ;; Start with home ~/ ...
  (add-to-list 'sml/replacer-regexp-list '("^~/workspace/" ":WS:") t)
  (add-to-list 'sml/replacer-regexp-list '("^~/Dropbox/" ":DB:") t)

  ;; SubDirs
  (add-to-list 'sml/replacer-regexp-list '("^:DB:workspace/" ":DBwork:") t)
  (add-to-list 'sml/replacer-regexp-list '("^:WS:clojure/" ":CLJ:") t))

(provide 'init-sml)
