;;; init-clojure.el --- Clojure related settings
;;; Commentary:
;; Cider -> https://github.com/clojure-emacs/cider
;;; Code:
(require-package 'clojure-mode)
(require-package 'cider)
(require 'clojure-mode)

;; Hook into smartparens
(add-hook 'clojure-mode-hook 'smartparens-strict-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(require 'cider)

;; Enable eldoc for cidermode
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; evil mappings.
(after 'evil
  (evil-define-key 'normal clojure-mode-map
    (kbd "g d") 'cider-jump-to-var
    (kbd "C-]") 'cider-jump-to-var
    (kbd "K") 'cider-doc
    (kbd "g K") 'cider-javadoc
    ;;Evaluate the current toplevel form. PREFIX => print in buffer.
    (kbd "<return>") 'cider-eval-defun-at-point
    (kbd "g X") 'cider-eval-buffer
    (kbd "g x") 'cider-eval-last-sexp)
  (evil-define-key 'visual clojure-mode-map
    (kbd "<return>") 'cider-eval-region)
  (evil-define-key 'normal cider-repl-mode-map (kbd "g K") 'cider-javadoc)
  (evil-define-key 'normal cider-mode-map (kbd "g K") 'cider-javadoc))

(provide 'init-clojure)
;;; init-clojure.el ends here
