;; Ido mode settings.
;; Some nuggets at http://www.masteringemacs.org/article/introduction-to-ido-mode
(progn
  (require-package 'ido-ubiquitous)
  ;; Fuzzy finder
  (setq ido-enable-flex-matching t)

  (setq ido-everywhere t)
  ;; AutoCompletions for C-x C-f (kinda cool, kinda jarring).
  (setq ido-use-filename-at-point 'guess)
  ;; Create new buffers by default when a buffer of that name does not exist.
  (setq ido-create-new-buffer 'always)
  ;; set order of files displayed in minibuffers
  ;; I dont have a preference at this point, but it could be useful down the road.
  ;;(setq ido-file-extension-order '(".clj" ".txt"))

  ;; Setting to true means that case is ignored.
  ;;(setq ido-case-fold t)


  ;; Turn on ido-mode
  (ido-mode t)

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
