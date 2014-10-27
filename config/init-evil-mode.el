;; Settings related to evil mode.

;; undo-tree is required for better undo.  for;
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

;; C-u to scroll please
(setq evil-want-C-u-scroll t)

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
 "b" 'ibuffer
 "e" 'switch-to-buffer
 "d" 'dired
 "gs" 'magit-status
 "x" 'smex
 "X" 'smex-major-mode-commands
 )

;; evil-surround
(global-evil-surround-mode t)

(evil-mode 1)

;; key definitions
;; the (kbd arg) allows bingind from keyboard with control, meta, and shift operators.

;; press ; in normal mode to got straight to command execution.
;; (define-key evil-normal-state-map ";" 'evil-ex)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;; Elisp
(eval-after-load 'elisp-slime-nav
  '(progn
    (evil-define-key 'normal emacs-lisp-mode-map
      (kbd "g s") 'elisp-slime-nav-find-elisp-thing-at-point
      (kbd "K")   'elisp-slime-nav-describe-elisp-thing-at-point
      (kbd "<return>") 'eval-defun
      (kbd "g X") 'eval-buffer)
    (evil-define-key 'visual emacs-lisp-mode-map
      (kbd "<return>") 'eval-region)))

;; Clojure mappings.
(eval-after-load 'cider
  '(progn
    (evil-define-key 'normal clojure-mode-map
      (kbd "g s") 'cider-jump
      (kbd "K") 'cider-doc
      (kbd "g K") 'cider-javadoc
      ;;Evaluate the current toplevel form. PREFIX => print in buffer.
      (kbd "<return>") 'cider-eval-defun-at-point
      (kbd "g X") 'cider-eval-buffer)
    (evil-define-key 'visual clojure-mode-map
      (kbd "<return>") 'cider-eval-region)
    (evil-define-key 'normal cider-repl-mode-map (kbd "g K") 'cider-javadoc)
    (evil-define-key 'normal cider-mode-map (kbd "g K") 'cider-javadoc)))

;; Magit mappings.
(eval-after-load 'magit
  '(progn
    (evil-add-hjkl-bindings magit-status-mode-map 'emacs
      "l" 'magit-key-mode-popup-logging)
    (evil-define-key 'normal magit-status-mode-map
      (kbd "[ c") 'magit-goto-previous-section
      (kbd "] c") 'magit-goto-next-section)
    (evil-define-key 'normal diff-mode-map
      (kbd "[ c") 'diff-hunk-prev
      (kbd "] c") 'diff-hunk-next)))

;; Key-chord mappings for evil - key-chord allows 2 key presses.
;; this requires fast typing
(require-package 'key-chord)
(require 'key-chord)
(key-chord-mode 1)

(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-visual-state-map "jk" 'evil-normal-state)
(key-chord-define evil-normal-state-map "vv" 'split-window-horizontally)
(key-chord-define evil-normal-state-map "ss" 'split-window-vertically)

(provide 'init-evil-mode)
