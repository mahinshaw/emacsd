(use-package fsharp-mode
  :defer t
  :ensure t
  :config
  (define-key fsharp-mode-map (kbd "C-c M-j") 'inferior-fsharp-show-subshell)

  (after 'evil
    (evil-define-key 'normal fsharp-mode-map
      (kbd "g d") 'fsharp-ac/gotodefn-at-point
      (kbd "g b") 'fsharp-ac/pop-gotodefn-stack
      (kbd "K") 'fsharp-ac/show-tooltip-at-point
      ;;Evaluate the current toplevel form. PREFIX => print in buffer.
      (kbd "<return>") 'fsharp-eval-phrase
      (kbd "g X") 'fsharp-load-buffer-file)
    (evil-define-key 'visual fsharp-mode-map
      (kbd "<return>") 'fsharp-eval-region))
  )

(provide 'init-fsharp)
