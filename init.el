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

;; Turns out that Custom adds junk to the init.  Lets get rid of that by putting it in a file called custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; set up the backups to go to their own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
		 (concat user-emacs-directory "backups")))))

;; Make backup files all the time, even when in versioning
(setq vc-make-backup-files t)

;; Here are some customizations that could be moved later
;; add line numbers, because i like to count.
(global-linum-mode t)

;; Add the config folder to the emacs dir.
(add-to-list 'load-path (concat user-emacs-directory "config"))

;; import modules.
(require 'cl)
(require 'init-packages)

;; color theme - must come after the packages are loaded!
(load-theme 'flatland t)

;; Define modules to import
(defcustom emacsd-modules
  '(init-evil-mode
    )
  "Set of my enabled modules"
  :group 'emacsd)

;; requall the modules in the above list.
(dolist (module emacsd-modules)
  (require module))

