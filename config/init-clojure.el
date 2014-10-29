;;; init-clojure.el --- Clojure related settings
;;; Commentary:
;; Cider -> https://github.com/clojure-emacs/cider
;;; Code:
(require-package 'clojure-mode)
(require-package 'cider)
(require 'clojure-mode)

;; Hook into smartparens
(add-hook 'clojure-mode 'smartparens-strict-mode)

(require 'cider)

;; Enable eldoc for cidermode
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(provide 'init-clojure)
;;; init-clojure.el ends here
