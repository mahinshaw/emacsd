;; Web-mode related configurations.
(use-package web-mode
  :ensure t
  :mode (("\\.html?\\'" . web-mode)
         ("\\.phtml\\'" . web-mode)
         ("\\.tpl\\.php\\'" . web-mode)
         ("\\.[agj]sp\\'" . web-mode)
         ("\\.as[cp]x\\'" . web-mode)
         ("\\.erb\\'" . web-mode)
         ("\\.mustache\\'" . web-mode)
         ("\\.djhtml\\'" . web-mode))
  :init
  ;; web mode pairing clobbers smartparens
  (setq web-mode-enable-auto-pairing nil)

  (defun my-web-mode-hook ()
    "Hook up with `web-mode'."
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2))

  (add-hook 'web-mode-hook 'my-web-mode-hook)
  )

;; Markdown is kinda the web, so for now, I will put it here
(use-package markdown-mode
  :defer t
  :ensure t
  :mode (("\\.text\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'" . markdown-mode))
  :init
  (autoload 'markdown-mode "markdown-mode"
    "Major mode for editing Markdown files." t)
  :config
  (after 'evil
    (evil-define-key 'normal markdown-mode-map
      (kbd "M-h") 'markdown-promote
      (kbd "M-l") 'markdown-demote
      (kbd "> >") 'markdown-indent-region
      (kbd "< <") 'markdown-exdent-region)
    (evil-define-key 'insert markdown-mode-map
      (kbd "M-h") 'markdown-promote
      (kbd "M-l") 'markdown-demote)
    )
  )

(provide 'init-web)
