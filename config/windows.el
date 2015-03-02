;; This file contains windows specific settings.

;; Add git bash dir to the runtime path
(add-to-list 'exec-path "C:/Program Files (x86)/Git/bin")

(set-face-font 'default "Source Code Pro 11")
;; settings to default to the git-bash shell
;;(setq shell-file-name "C:/Program Files (x86)/Git/bin/sh")
;;(setq explicit-shell-file-name shell-file-name)
;;(setq explicit-sh-args '("--noediting" "--login" "-i"))
;;(setenv "SHELL" shell-file-name)
;;(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

;; Make a function that calls the git bash.
;; Not currently working
(defun git-bash ()
  "Run the Msysgit bash shell in shell mode."
  (interactive)
  (let ((explicit-shell-file-name "C:/Program Files (x86)/Git/bin/sh"))
    (call-interactively 'shell)))

;; Maximize the window when on Windows
(defun maximize-frame()
  "Maximize the active from in windows"
  (interactive)
  (w32-send-sys-command 61488))

;; hook in on startup
;; 24.4 add toggle-frame-maximized and toggle-frame-fullscreen
(if (functionp 'toggle-frame-maximized)  
    (add-hook 'window-setup-hook 'toggle-frame-maximized t)
  (add-hook 'window-setup-hook 'maximize-frame t))
(if (functionp 'toggle-frame-fullscreen)
    (global-set-key (kbd "M-RET") 'toggle-frame-fullscreen))

;; GnuTLS
(when 'gnutls-available-p
  (setq gnutls-trustfiles "C:/Users/Mark/.ssh/cacert.pem"))

(prefer-coding-system 'utf-8)

;;(eval-after-load 'projectile
;;       (setq projectile-indexing-method alien))

(provide 'windows)
