;; Settings related to Magit
;; Nuggets @ http://www.masteringemacs.org/article/introduction-magit-emacs-mode-git
(use-package magit
  :defer t
  :ensure t
  :init
  ;; open the magit status buffer in the current buffer.
  (setq magit-status-buffer-switch-function 'switch-to-buffer)
  :config
  ;; Magit mappings.
  (after 'evil
    (evil-add-hjkl-bindings magit-status-mode-map 'emacs
      "l" 'magit-key-mode-popup-logging)
    (evil-define-key 'normal magit-status-mode-map
      (kbd "[ c") 'magit-goto-previous-section
      (kbd "] c") 'magit-goto-next-section)
    (evil-define-key 'emacs magit-log-mode-map
      "j" 'magit-goto-next-section
      "k" 'magit-goto-previous-section)
    (evil-define-key 'emacs magit-commit-mode-map
      "j" 'magit-goto-next-section
      "k" 'magit-goto-previous-section)
    (evil-define-key 'emacs magit-diff-mode-map
      "j" 'magit-goto-next-section
      "k" 'magit-goto-previous-section
      (kbd "[ c") 'diff-hunk-prev
      (kbd "] c") 'diff-hunk-next)
    (evil-define-key 'normal diff-mode-map
      (kbd "[ c") 'diff-hunk-prev
      (kbd "] c") 'diff-hunk-next))
  :diminish magit-auto-revert-mode)

(provide 'init-magit)
