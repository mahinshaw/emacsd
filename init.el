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
;; auto-indent
(electric-indent-mode t)

;; Add the config folder to the emacs dir.
(add-to-list 'load-path (concat user-emacs-directory "config"))

;; import modules.
(require 'cl)
(require 'init-packages)
(require 'init-utils)

;; Mac specific
(when is-mac
  (require 'mac))

;; Windows specific
(when is-windows
  (require 'windows))

;; color theme - must come after the packages are loaded!
(load-theme 'flatland t)

;; elisp slime nav mode
(require 'elisp-slime-nav)
(defun my-lisp-hook ()
  "Start up eldoc in elisp-slime-nav-mode."
  (elisp-slime-nav-mode)
  (eldoc-mode))

(add-hook 'emacs-lisp-mode-hook 'my-lisp-hook)

;; Define modules to import
(defcustom emacsd-modules
  '(better-defaults
    init-ido
    ;; init-helm Use Ido for now, since I am a noob
    init-company
    init-flycheck
    init-org
    init-clojure
    init-csharp
    init-magit
    init-smartparens
    init-projectile
    init-evil-mode)
  "Set of my enabled modules."
  :group 'emacsd)

;; require all the modules in the above list.
(dolist (module emacsd-modules)
  (require module))
;;; init.el ends here
