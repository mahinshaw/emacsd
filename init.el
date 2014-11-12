;;; init.el --- Define a group for these files

;;; Commentary:
;;; Learning me some emacs.d

;;; Code:
(defgroup emacsd nil
  "Configs for my emacs"
  :group 'local)

;; Set up a custom caching directory for the local machine
(defcustom emacsd-cache-directory (concat user-emacs-directory ".cache/")
  "This is a storage location for backups and other persistent files."
  :group 'emacsd)

;; Settings for initialzation
;; Turn off all the nagging menus
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; to get rid of the splash screen uncomment the following
(setq inhibit-startup-message t)

;; Turns out that Custom adds junk to the init.
;; Lets get rid of that by putting it in a file called custom.el
(when (file-readable-p (expand-file-name "custom.el" user-emacs-directory))
  (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
  (load custom-file))

;; use saveplave package
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file
      (concat emacsd-cache-directory "places"))

;; set up the backups to go to their own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat emacsd-cache-directory "backups")))))

;; Make backup files all the time, even when in versioning
(setq vc-make-backup-files t)

;; Here are some customizations that could be moved later
;; -------------------------------------------
;; add line numbers, because i like to count.
(global-linum-mode t)
(setq linum-delay t)
;; auto-indent
(electric-indent-mode t)

;; Autosave every 500 typed words
(setq auto-save-interval 500)
;; Scrolling
(setq scroll-conservatively 10000) ;; scroll conservatively
(setq scroll-step 1)               ;; scroll one line at a time.
(setq scroll-margin 10)            ;; scroll when 10 lines from bottom or top.
(setq hscroll-step 1)              ;; scroll one column at a time.
(setq hscroll-margin 8)            ;; scroll when 8 lines from left or right.

;; Add the config folder to the emacs dir.
(add-to-list 'load-path (concat user-emacs-directory "config"))

;; import modules.
(require 'cl)
(require 'init-packages)
(require 'init-utils)

;; Define modules to import
(defcustom emacsd-modules
  '(init-misc
    init-ido
    ;; init-helm Use Ido for now, since I am a noob
    init-company
    init-flycheck
    init-org
    init-clojure
    init-csharp
    init-web
    init-eclim
    init-magit
    init-smartparens
    init-projectile
    init-evil-mode)
  "Set of my enabled modules."
  :group 'emacsd)

;; require all the modules in the above list.
(dolist (module emacsd-modules)
  (require module))

;; Mac specific
(when is-mac
  (require 'mac))

;; Windows specific
(when is-windows
  (require 'windows))

;; emacsclient please.
(require 'server)
(unless 'server-running-p
  (server-start))

;; color theme - must come after the packages are loaded!
(require-package 'flatland-theme)
(load-theme 'flatland t)

;;; init.el ends here
