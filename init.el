;; Define a group for these files
(defgroup emacsd nil
  "Configs for my emacs"
  :group 'local)

;; Set up a custom caching directory for the local machine
(defcustom emacsd-cache-directory (concat user-emacs-directory ".cache")
  "This is a storage location for backups and other persistent files."
  :group 'emacsd)

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
     (concat emacsd-cache-directory "backups")))))

;; Make backup files all the time, even when in versioning
(setq vc-make-backup-files t)

;; Am I using a mac?
(setq is-mac (equal system-type 'darwin))


;; Here are some customizations that could be moved later
;; -------------------------------------------
;; add line numbers, because i like to count.
(global-linum-mode t)
;; auto-indent
(electric-indent-mode t)

;; -------------------------------------------

;; Add the config folder to the emacs dir.
(add-to-list 'load-path (concat user-emacs-directory "config"))

;; import modules.
(require 'cl)
(require 'init-packages)

;; If so, set PATH variables with exec-path-from-shell
(when is-mac
  (require-package 'exec-path-from-shell)
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

;; Mac specific
(when is-mac
  (require 'mac))

;; auto-complete - can move to its own file
;;(require-package 'auto-complete)
;;(require 'auto-complete)
;;(require 'auto-complete-config)

(setq ac-comphist-file (concat emacsd-cache-directory "ac-comphidt.dat"))

;; color theme - must come after the packages are loaded!
(load-theme 'misterioso t)

;; Define modules to import
(defcustom emacsd-modules
  '(init-evil-mode
    init-helm
    )
  "Set of my enabled modules"
  :group 'emacsd)

;; requall the modules in the above list.
(dolist (module emacsd-modules)
  (require module))

