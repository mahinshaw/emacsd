;; Settings related to evil mode.

;; undo-tree is required for better undo.  for
;; For now it can stay with evil
(require-package 'undo-tree)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist
      `(("." . ,(concat emacsd-cache-directory "undo"))))

(global-undo-tree-mode)

;; Settings for evil-mode before loading as per docs
;; Customize the cursor based on the state.
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-insert-state-cursor '("yellow" bar))
(setq evil-replace-state-cursor '("yellow" box))
(setq evil-visual-state-cursor '("blue" box))
(setq evil-operator-state-cursor '("yellow" box))
(setq evil-motion-state-cursor '("yellow" box))

;; require the package.
(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-surround)

;; require the plugin to be loaded
(require 'evil)
(require 'evil-leader)
(require 'evil-surround)

;; the following are required before evil-mode is set
;; evil-leader
;; This line makes sure the leader is usable in all Modes
(setq evil-leader/in-all-states 1)

(global-evil-leader-mode t)
(evil-leader/set-leader ",")
(evil-leader/set-key
 "h" help-map
 "f" 'find-file
 "b" 'switch-to-buffer)

;; evil-surround
(global-evil-surround-mode t)

(evil-mode 1)

;; key definitions
;; the (kbd arg) allows bingind from keyboard with control, meta, and shift operators.

;; press ; in normal mode to got straight to command execution.
(define-key evil-normal-state-map ";" 'evil-ex)

;; evil-define-key allows single key rebindings
;; (evil-define-key evil-normal-state-map "

;; Key-chord mappings for evil - key-chord allows 2 key presses.
;; this requires fast typing
(require-package 'key-chord)
(require 'key-chord)
(key-chord-mode 1)

(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(provide 'init-evil-mode)
