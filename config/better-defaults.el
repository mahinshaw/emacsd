;;; better-defaults.el --- Fixing weird quirks and poor defaults

;; Copyright © 2013 Phil Hagelberg and contributors

;; Author: Phil Hagelberg
;; URL: https://github.com/technomancy/better-defaults
;; Version: 0.1.2
;; Created: 2013-04-16
;; Keywords: convenience

;; This file is NOT part of GNU Emacs.

;;; Commentary:

;; There are a number of unfortunate facts about the way Emacs works
;; out of the box. While all users will eventually need to learn their
;; way around in order to customize it to their particular tastes,
;; this package attempts to address the most obvious of deficiencies
;; in uncontroversial ways that nearly everyone can agree upon.

;; Obviously there are many further tweaks you could do to improve
;; Emacs, (like those the Starter Kit and similar packages) but this
;; package focuses only on those that have near-universal appeal.

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

;;;###autoload
(progn
  ;; Moved to init-ido.el
  ;;(ido-mode t)
  ;;(setq ido-enable-flex-matching t)

  ;; already being used in init.el
  ;;(menu-bar-mode -1)
  ;;(when (fboundp 'tool-bar-mode)
    ;;(tool-bar-mode -1))
  ;;(when (fboundp 'scroll-bar-mode)
    ;;(scroll-bar-mode -1))

  (autoload 'zap-up-to-char "misc"
    "Kill up to, but not including ARGth occurrence of CHAR." t)

  ;; Uniquify lets the buffer use the directory.  Forward says use forwared slashes.
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)

  ;; Saves the last place in the buffer.
  (require 'saveplace)
  (setq-default save-place t)
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
        ediff-window-setup-function 'ediff-setup-windows-plain
        ))
;; duplicate functions that were removed from the above block.
        ;;backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")
        ;;save-place-file (concat user-emacs-directory "places")

(provide 'better-defaults)
;;; better-defaults.el ends here
