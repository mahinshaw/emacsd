(setq package-archives '(
			 ("melpa" . "http://melpa.milkbox.net/packages/")
 			 ("org" . "http://orgmode.org/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

;; since we set packages
(defun require-package (package)
  "Install the passed 'package'."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

;; Make this file reference-able
(provide 'init-packages)
