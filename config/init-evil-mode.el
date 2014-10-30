;;; package --- summary
;;; Commentary:

;; some help found @
;; http://nathantypanski.com/blog/2014-08-03-a-vim-like-emacs-config.html#dired

;;Settings related to evil mode.

;; undo-tree is required for better undo.  for;
;; For now it can stay with evil
;;; Code:
(require-package 'undo-tree)
(require 'undo-tree)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist
      `(("." . ,(concat emacsd-cache-directory "undo"))))

(global-undo-tree-mode)

;; Customize the cursor based on the state.
(setq evil-emacs-state-cursor '("red" bar))
(setq evil-normal-state-cursor '("green" box))
(setq evil-insert-state-cursor '("yellow" bar))
(setq evil-replace-state-cursor '("yellow" box))
(setq evil-visual-state-cursor '("blue" box))
(setq evil-operator-state-cursor '("yellow" box))
(setq evil-motion-state-cursor '("yellow" box))

;; C-u to scroll please
(setq evil-want-C-u-scroll t)

;; require the package.
(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-surround)
(require-package 'evil-jumper)

;; require the plugin to be loaded
(require 'evil)
(require 'evil-leader)
(require 'evil-surround)
(require 'evil-jumper)

;; the following are required before evil-mode is set
;; evil-leader
;; This line makes sure the leader is usable in all Modes
(setq evil-leader/in-all-states 1)
;; Leader bindings
(global-evil-leader-mode t)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "h" help-map
  "f" 'find-file
  "b" 'ibuffer
  "e" 'switch-to-buffer
  "d" 'dired
  "ms" 'magit-status
  "x" 'smex
  "X" 'smex-major-mode-commands
  "q" 'kill-buffer-and-window
  "," 'other-window
  "pf" 'projectile-find-file
  "pd" 'projectile-find-dir
  "pD" 'projectile-dired
  "ps" 'projectile-switch-project
  "pb" 'projectile-project-buffers
  )

;; evil-surround
(global-evil-surround-mode t)

(evil-mode 1)

;; key definitions
;; the (kbd arg) allows bingind from keyboard with control, meta, and shift operators.
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
;; I needs me arrows
(define-key evil-insert-state-map (kbd "C-l") "=> ")
(define-key evil-insert-state-map (kbd "C-k") "-> ")
(define-key evil-insert-state-map (kbd "C-j") "->> ")
(define-key evil-insert-state-map (kbd "C-h") "<- ")

;; Key-chord mappings for evil - key-chord allows 2 key presses.
;; this requires fast typing
(require-package 'key-chord)
(require 'key-chord)
(key-chord-mode 1)

(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-visual-state-map "jk" 'evil-normal-state)
(key-chord-define evil-normal-state-map "vv" 'split-window-horizontally)
(key-chord-define evil-normal-state-map "ss" 'split-window-vertically)

;; modes that need a specific initial state other than insert.
(dolist (mode-map '((git-commit-mode . insert)
                    (cider-repl-mode . emacs)))
  (evil-set-initial-state `,(car mode-map) `,(cdr mode-map)))

(provide 'init-evil-mode)
;;; init-evil-mode.el ends here
