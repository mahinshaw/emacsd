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

;; require the plugin to be loaded
(require 'evil)
(require 'evil-leader)
(require 'evil-surround)

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
 "gs" 'magit-status
 "x" 'smex
 "X" 'smex-major-mode-commands
 "q" 'kill-buffer-and-window
 "," 'other-window
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
;; Elisp
(after 'elisp-slime-nav
    (evil-define-key 'normal emacs-lisp-mode-map
      (kbd "g s") 'elisp-slime-nav-find-elisp-thing-at-point
      (kbd "K")   'elisp-slime-nav-describe-elisp-thing-at-point
      (kbd "<return>") 'eval-defun
      (kbd "g X") 'eval-buffer)
    (evil-define-key 'visual emacs-lisp-mode-map
      (kbd "<return>") 'eval-region))

;; Clojure mappings.
(after 'cider
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
    (evil-define-key 'normal cider-mode-map (kbd "g K") 'cider-javadoc))

;; Magit mappings.
(after 'magit
    (evil-add-hjkl-bindings magit-status-mode-map 'emacs
      "l" 'magit-key-mode-popup-logging)
    (evil-define-key 'normal magit-status-mode-map
      (kbd "[ c") 'magit-goto-previous-section
      (kbd "] c") 'magit-goto-next-section)
    (evil-define-key 'emacs magit-log-mode-map
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

;; Hijack the ibuffer for evil normal state
(after 'ibuffer
    (evil-set-initial-state 'ibuffer-mode 'normal)
    (evil-define-key 'normal ibuffer-mode-map
      (kbd "0") 'digit-argument
      (kbd "1") 'digit-argument
      (kbd "2") 'digit-argument
      (kbd "3") 'digit-argument
      (kbd "4") 'digit-argument
      (kbd "5") 'digit-argument
      (kbd "6") 'digit-argument
      (kbd "7") 'digit-argument
      (kbd "8") 'digit-argument
      (kbd "9") 'digit-argument

      (kbd "m") 'ibuffer-mark-forward
      (kbd "t") 'ibuffer-toggle-marks
      (kbd "u") 'ibuffer-unmark-forward
      (kbd "=") 'ibuffer-diff-with-file

      ;; REMOVED
      ;; (kbd "j") 'ibuffer-jump-to-buffer
      ;; (kbd "k") 'ibuffer-mark-for-delete
      ;; (kbd "k") 'ibuffer-do-kill-lines
      ;; CHANGED
      (kbd "J") 'ibuffer-jump-to-buffer
      (kbd "K") 'ibuffer-do-kill-lines
      ;; ADDED
      (kbd "j") 'evil-next-line
      (kbd "k") 'evil-previous-line

      (kbd "M-g") 'ibuffer-jump-to-buffer
      (kbd "M-s a C-s") 'ibuffer-do-isearch
      (kbd "M-s a M-C-s") 'ibuffer-do-isearch-regexp
      (kbd "DEL") 'ibuffer-unmark-backward
      (kbd "M-DEL") 'ibuffer-unmark-all
      (kbd "* *") 'ibuffer-unmark-all
      (kbd "* M") 'ibuffer-mark-by-mode
      (kbd "* m") 'ibuffer-mark-modified-buffers
      (kbd "* u") 'ibuffer-mark-unsaved-buffers
      (kbd "* s") 'ibuffer-mark-special-buffers
      (kbd "* r") 'ibuffer-mark-read-only-buffers
      (kbd "* /") 'ibuffer-mark-dired-buffers
      (kbd "* e") 'ibuffer-mark-dissociated-buffers
      (kbd "* h") 'ibuffer-mark-help-buffers
      (kbd "* z") 'ibuffer-mark-compressed-file-buffers
      (kbd ".") 'ibuffer-mark-old-buffers

      (kbd "d") 'ibuffer-mark-for-delete
      (kbd "C-d") 'ibuffer-mark-for-delete-backwards
      (kbd "x") 'ibuffer-do-kill-on-deletion-marks

      ;; immediate operations
      (kbd "n") 'ibuffer-forward-line
      (kbd "SPC") 'forward-line
      (kbd "p") 'ibuffer-backward-line
      (kbd "M-}") 'ibuffer-forward-next-marked
      (kbd "M-{") 'ibuffer-backwards-next-marked
      (kbd "l") 'ibuffer-redisplay
      (kbd "g") 'ibuffer-update
      "`" 'ibuffer-switch-format
      "-" 'ibuffer-add-to-tmp-hide
      "+" 'ibuffer-add-to-tmp-show
      "b" 'ibuffer-bury-buffer
      (kbd ",") 'ibuffer-toggle-sorting-mode
      (kbd "s i") 'ibuffer-invert-sorting
      (kbd "s a") 'ibuffer-do-sort-by-alphabetic
      (kbd "s v") 'ibuffer-do-sort-by-recency
      (kbd "s s") 'ibuffer-do-sort-by-size
      (kbd "s f") 'ibuffer-do-sort-by-filename/process
      (kbd "s m") 'ibuffer-do-sort-by-major-mode

      (kbd "/ m") 'ibuffer-filter-by-used-mode
      (kbd "/ M") 'ibuffer-filter-by-derived-mode
      (kbd "/ n") 'ibuffer-filter-by-name
      (kbd "/ c") 'ibuffer-filter-by-content
      (kbd "/ e") 'ibuffer-filter-by-predicate
      (kbd "/ f") 'ibuffer-filter-by-filename
      (kbd "/ >") 'ibuffer-filter-by-size-gt
      (kbd "/ <") 'ibuffer-filter-by-size-lt
      (kbd "/ r") 'ibuffer-switch-to-saved-filters
      (kbd "/ a") 'ibuffer-add-saved-filters
      (kbd "/ x") 'ibuffer-delete-saved-filters
      (kbd "/ d") 'ibuffer-decompose-filter
      (kbd "/ s") 'ibuffer-save-filters
      (kbd "/ p") 'ibuffer-pop-filter
      (kbd "/ !") 'ibuffer-negate-filter
      (kbd "/ t") 'ibuffer-exchange-filters
      (kbd "/ TAB") 'ibuffer-exchange-filters
      (kbd "/ o") 'ibuffer-or-filter
      (kbd "/ g") 'ibuffer-filters-to-filter-group
      (kbd "/ P") 'ibuffer-pop-filter-group
      (kbd "/ D") 'ibuffer-decompose-filter-group
      (kbd "/ /") 'ibuffer-filter-disable

      (kbd "M-n") 'ibuffer-forward-filter-group
      "\t" 'ibuffer-forward-filter-group
      (kbd "M-p") 'ibuffer-backward-filter-group
      [backtab] 'ibuffer-backward-filter-group
      (kbd "M-j") 'ibuffer-jump-to-filter-group
      (kbd "C-k") 'ibuffer-kill-line
      (kbd "C-y") 'ibuffer-yank
      (kbd "/ S") 'ibuffer-save-filter-groups
      (kbd "/ R") 'ibuffer-switch-to-saved-filter-groups
      (kbd "/ X") 'ibuffer-delete-saved-filter-groups
      (kbd "/ \\") 'ibuffer-clear-filter-groups

      (kbd "q") 'ibuffer-quit
      (kbd "h") 'describe-mode
      (kbd "?") 'describe-mode

      (kbd "% n") 'ibuffer-mark-by-name-regexp
      (kbd "% m") 'ibuffer-mark-by-mode-regexp
      (kbd "% f") 'ibuffer-mark-by-file-name-regexp

      (kbd "C-t") 'ibuffer-visit-tags-table

      (kbd "|") 'ibuffer-do-shell-command-pipe
      (kbd "!") 'ibuffer-do-shell-command-file
      (kbd "~") 'ibuffer-do-toggle-modified
      ;; marked operations
      (kbd "A") 'ibuffer-do-view
      (kbd "D") 'ibuffer-do-delete
      (kbd "E") 'ibuffer-do-eval
      (kbd "F") 'ibuffer-do-shell-command-file
      (kbd "I") 'ibuffer-do-query-replace-regexp
      (kbd "H") 'ibuffer-do-view-other-frame
      (kbd "N") 'ibuffer-do-shell-command-pipe-replace
      (kbd "M") 'ibuffer-do-toggle-modified
      (kbd "O") 'ibuffer-do-occur
      (kbd "P") 'ibuffer-do-print
      (kbd "Q") 'ibuffer-do-query-replace
      (kbd "R") 'ibuffer-do-rename-uniquely
      (kbd "S") 'ibuffer-do-save
      (kbd "T") 'ibuffer-do-toggle-read-only
      (kbd "U") 'ibuffer-do-replace-regexp
      (kbd "V") 'ibuffer-do-revert
      (kbd "W") 'ibuffer-do-view-and-eval
      (kbd "X") 'ibuffer-do-shell-command-pipe

      (kbd "w") 'ibuffer-copy-filename-as-kill

      (kbd "RET") 'ibuffer-visit-buffer
      (kbd "e") 'ibuffer-visit-buffer
      (kbd "f") 'ibuffer-visit-buffer
      (kbd "C-x C-f") 'ibuffer-find-file
      (kbd "o") 'ibuffer-visit-buffer-other-window
      (kbd "C-o") 'ibuffer-visit-buffer-other-window-noselect
      (kbd "M-o") 'ibuffer-visit-buffer-1-window
      (kbd "v") 'ibuffer-do-view
      (kbd "C-x v") 'ibuffer-do-view-horizontally
      (kbd "C-c C-a") 'ibuffer-auto-mode
      (kbd "C-x 4 RET") 'ibuffer-visit-buffer-other-window
      (kbd "C-x 5 RET") 'ibuffer-visit-buffer-other-frame))

;; Hijack Dired
(after 'dired
     (put 'dired-find-alternate-file 'disabled nil)
     (evil-define-key 'normal dired-mode-map "h" 'dired-up-directory)
     (evil-define-key 'normal dired-mode-map "l" 'dired-find-alternate-file)
     (evil-define-key 'normal dired-mode-map "n" 'evil-search-next)
     (evil-define-key 'normal dired-mode-map "N" 'evil-search-previous)
     ;; open a dired buffer here and go up up up, like vim-vinegar
     (evil-define-key 'normal dired-mode-map "-" 'dired-up-directory)
     (define-key evil-normal-state-map "-"
       (lambda ()
         (interactive)
         (dired "."))))

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
