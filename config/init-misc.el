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
(global-aggressive-indent-mode)

;; elisp slime nav mode
(require 'elisp-slime-nav)
;; When entering emacs-lisp-mode, use elisp-slime-nav-mode and eldoc-mode.
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (elisp-slime-nav-mode)
            (eldoc-mode)))

(provide 'init-misc)
;;; init-misc.el ends here
