;; Ido mode settings.
;; Some nuggets at http://www.masteringemacs.org/article/introduction-to-ido-mode
(progn
  (require-package 'ido-ubiquitous)
  (require-package 'flx-ido)
  (require-package 'smex)

  (require 'ido-ubiquitous)
  (require 'flx-ido)
  ;; Turn on ido-mode
  (ido-mode t)
  (ido-ubiquitous-mode t)
  ;; Better Fuzzy finder
  (flx-ido-mode 1)

  ;; Really use ido everywhere.
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-use-faces nil
        ido-use-filename-at-point 'guess
        ido-max-prospects 10
        ido-create-new-buffer 'always
        ido-save-directory-list-file (expand-file-name "ido.hist" emacsd-cache-directory)
        ido-ignore-files '("flycheck_" "#*#")
        ido-ignore-extensions t
        completion-ignored-extensions '(".obj" ".pdb" ".exe" ".dll"))

  ;; Use smex - It's here because it is attached to Ido
  (require 'smex)
  (setq smex-save-file (expand-file-name ".smex-items" emacsd-cache-directory))
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-command))

(provide 'init-ido)
