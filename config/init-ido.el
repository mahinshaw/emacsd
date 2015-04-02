;; Ido mode settings.
;; Some nuggets at http://www.masteringemacs.org/article/introduction-to-ido-mode
(use-package ido-ubiquitous
  :ensure t
  :init
  (progn
    (ido-mode t)
    (ido-ubiquitous-mode t)
    (setq ido-enable-prefix nil
          ido-enable-flex-matching t
          ido-use-faces nil
          ido-use-filename-at-point 'guess
          ido-max-prospects 10
          ido-create-new-buffer 'always
          ido-save-directory-list-file (expand-file-name "ido.hist" emacsd-cache-directory)
          ido-ignore-files '("flycheck_" "#*#")
          ido-ignore-extensions t
          completion-ignored-extensions '(".obj" ".pdb" ".exe" ".dll"))))

(use-package flx-ido
  :ensure t
  :init (flx-ido-mode 1))

(use-package smex
  :ensure t
  :init (setq smex-save-file (expand-file-name ".smex-items" emacsd-cache-directory))
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)))

(provide 'init-ido)
