;; Ido mode settings.
;; Some nuggets at http://www.masteringemacs.org/article/introduction-to-ido-mode
(progn
  (require-package 'ido-ubiquitous)
  (require-package 'flx-ido)
  (require 'flx-ido)
  ;; Turn on ido-mode
  (ido-mode t)
  (setq ido-everywhere t)
  ;; turn on ido-flx
  (flx-ido-mode 1)

  ;; Fuzzy finder
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil)
  ;; AutoCompletions for C-x C-f (kinda cool, kinda jarring).
  (setq ido-use-filename-at-point 'guess)
  ;; Create new buffers by default when a buffer of that name does not exist.
  (setq ido-create-new-buffer 'always)
  ;; set order of files displayed in minibuffers
  ;; I dont have a preference at this point, but it could be useful down the road.
  ;;(setq ido-file-extension-order '(".clj" ".txt"))

  ;; Setting to true means that case is ignored.
  ;;(setq ido-case-fold t)

  ;; Really use ido everywhere.
  (require 'ido-ubiquitous)
  (setq ido-ubiquitous-mode 1)

  ;; Use smex - It's here because it is attached to Ido
  (require-package 'smex)
  (require 'smex)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-command)
  )

(provide 'init-ido)
