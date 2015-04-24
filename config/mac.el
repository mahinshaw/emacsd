;;; mac.el --- Setting for the mac
;;; Commentary:
;;; Code:
;; set the face and font
(set-face-font 'default "Source Code Pro 14")

;;change the command key to the meta key
(setq mac-option-modifier 'super
      mac-command-modifier 'meta

      ;; dont use native full screen
      ns-use-native-fullscreen nil)

;; Toggle me fullscreen timbers with cmd-Enter -- also F11
(global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)

;; set PATH variables with exec-path-from-shell
(after 'init-packages
  (require-package 'exec-path-from-shell)
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

(provide 'mac)
;;; mac.el ends here
