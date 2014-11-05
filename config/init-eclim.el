(require-package 'emacs-eclim)
(require 'eclim)
(require 'eclimd)

(custom-set-variables
 '(eclim-eclipse-dirs '("C:\eclipse"))
 '(eclim-executable "C:\eclipse\eclim"))

;; company completion.
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)

(provide 'init-eclim)
