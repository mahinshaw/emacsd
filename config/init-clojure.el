;; Clojure related settings
;; Cider -> https://github.com/clojure-emacs/cider
(require-package 'clojure-mode)
(require-package 'cider)
(require 'clojure-mode)

;; Hook into smartparens
(add-hook 'clojure-mode 'smartparens-strict-mode)

(require 'cider)

;; Enable eldoc for cidermode
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(provide 'init-clojure)
