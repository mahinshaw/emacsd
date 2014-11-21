;;; init-clojure.el --- Clojure related settings
;;; Commentary:
;; Cider -> https://github.com/clojure-emacs/cider
;;; Code:
(require-package 'clojure-mode)
(require-package 'cider)
(require 'clojure-mode)

;; Hooks
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(require 'cider)
(setq
 nrepl-log-messages t
 cider-repl-use-clojure-font-lock t
 cider-test-show-report-on-success t
 cider-prompt-save-file-on-load nil
 )

;; REPL hooks
;; Enable eldoc for cidermode
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

;; evil mappings.
(after 'evil
  (evil-define-key 'normal clojure-mode-map
    (kbd "g d") 'cider-jump-to-var
    (kbd "g b") 'cider-jump-back
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
