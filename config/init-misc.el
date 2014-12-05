;;; init-misc.el --- Miscellaneous stuff
;;; Commentary:
;; This init file contains packages/settings that do not require their own file.
;; There are also settings taken from better-defaults.el
;;; Code:

;;; Taken from better-defaults.el
(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR." t)

;; Uniquify lets the buffer use the directory.  Forward says use forwared slashes.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Autocomplete in place; Expand completion options in place.
(global-set-key (kbd "M-/") 'hippie-expand)
;; Remap new window buffer to use ibuffer.
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; kills up to but not including the character passed as a param.  (like dt{char} in vim)
(global-set-key (kbd "M-z") 'zap-up-to-char)

;; use regex for incremental search by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
;; Remap incremental search in case you actually want that.
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; show matching parens please!
(show-paren-mode 1)
;; setting indent-tabs-mode to nil means indent with spaces.
(setq-default indent-tabs-mode nil)

(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      require-final-newline t
      visible-bell t
      ediff-window-setup-function 'ediff-setup-windows-plain)
;;; end taken from better-defaults.el

;; Aggressive-indent
(require-package 'aggressive-indent)
(require 'aggressive-indent)
(diminish 'aggressive-indent-mode)
(global-aggressive-indent-mode)

;; elisp slime nav mode
(require-package 'rainbow-delimiters)
(require-package 'elisp-slime-nav)
(require 'elisp-slime-nav)
(diminish 'elisp-slime-nav-mode)
;; When entering emacs-lisp-mode, use elisp-slime-nav-mode and eldoc-mode.
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (elisp-slime-nav-mode)
            (eldoc-mode)
            (rainbow-delimiters-mode)))

(add-hook 'ielm-mode-hook 'eldoc-mode)

;; evil mappings
(after 'evil
  ;; Package Meny
  (define-key package-menu-mode-map (kbd "/") 'evil-search-forward)
  (define-key package-menu-mode-map (kbd "?") 'evil-search-backward)
  (define-key package-menu-mode-map (kbd "n") 'evil-next-match)
  (define-key package-menu-mode-map (kbd "N") 'evil-next-match)
  (define-key package-menu-mode-map (kbd "j") 'next-line)
  (define-key package-menu-mode-map (kbd "k") 'previous-line))

(after 'evil
  ;; Elisp
  (evil-define-key 'normal emacs-lisp-mode-map
    (kbd "g d") 'elisp-slime-nav-find-elisp-thing-at-point
    (kbd "K")   'elisp-slime-nav-describe-elisp-thing-at-point
    (kbd "<return>") 'eval-defun
    (kbd "g X") 'eval-buffer
    (kbd "g x") 'eval-last-sexp)
  (evil-define-key 'visual emacs-lisp-mode-map
    (kbd "<return>") 'eval-region)

  ;; ielm
  (evil-define-key 'insert ielm-map
    (kbd "C-f") 'comint-next-input
    (kbd "C-b") 'comint-previous-input)

  ;; Hijack the ibuffer for evil normal state
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
    (kbd "C-x 5 RET") 'ibuffer-visit-buffer-other-frame)

  ;; Hijack Dired
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

(provide 'init-misc)
;;; init-misc.el ends here
