;;; init-clojure.el --- Clojure related settings
;;; Commentary:
;; Cider -> https://github.com/clojure-emacs/cider
;;; Code:
(require-package 'clojure-mode)
(require-package 'cider)
(require 'clojure-mode)
(require-package 'clojure-mode-extra-font-locking)
(require 'clojure-mode-extra-font-locking)

;; Boot files should use clojure mode
(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.hl\\'" . clojure-mode))

;; Hooks
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'superword-mode)

(require 'cider)
(diminish 'cider-mode)

(setq
 nrepl-log-messages t
 cider-repl-use-clojure-font-lock t
 cider-test-show-report-on-success t
 cider-prompt-save-file-on-load nil
 )

(defun cider-eval-defun-at-point-in-repl ()
  (interactive)
  (let ((form (cider-defun-at-point)))
    ;; strip excess white space
    (while (string-match "\\`\s+\\|\n+\\'" form)
      (setq form (replace-match "" t t form)))
    (set-buffer (cider-get-repl-buffer))
    (goto-char (point-max))
    (insert form)
    (cider-repl-return)))

(define-key cider-mode-map (kbd "C-c M-r") 'cider-eval-defun-at-point-in-repl)

;; REPL hooks
;; Enable eldoc for cidermode
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'superword-mode)

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
    (kbd "<C-return>") 'cider-eval-defun-at-point-in-repl
    (kbd "g X") 'cider-eval-buffer
    (kbd "g x") 'cider-eval-last-sexp)
  (evil-define-key 'visual clojure-mode-map
    (kbd "<return>") 'cider-eval-region)
  (evil-define-key 'normal cider-repl-mode-map (kbd "g K") 'cider-javadoc)
  (evil-define-key 'normal cider-mode-map (kbd "g K") 'cider-javadoc))

(provide 'init-clojure)
;;; init-clojure.el ends here
