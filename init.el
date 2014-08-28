;; Define a group for these files
(defgroup emacsd nil
  "Configs for my emacs"
  :group 'local)

;; Settings for initialzation
;; Turn off all the nagging menus
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; to get rid of the splash screen uncomment the following
(setq inhibit-startup-message t)

;; set up the backups to go to their own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
		 (concat user-emacs-directory "backups")))))

;; Make backup files all the time, even when in versioning
(setq vc-make-backup-files t)

;; Add the config folder to the emacs dir.
(add-to-list 'load-path (concat user-emacs-directory "config"))

;; import modules.
(require 'cl)
(require 'init-packages)

;; Define modules to import
(defcustom emacsd-modules
  '(init-evil-mode
    )
  "Set of my enabled modules"
  :group 'emacsd)

(dolist (module emacsd-modules)
  (require module))

;;(load "~/.emacs.d/init-evil-mode.el")

;; line numbers?
(linum-mode 1)
