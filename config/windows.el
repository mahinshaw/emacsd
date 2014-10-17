;; This file contains windows specific settings.

;; Add git bash dir to the runtime path
(add-to-list 'exec-path "C:/Program Files (x86)/Git/bin")

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
(add-hook 'window-setup-hook 'maximize-frame t)

(provide 'windows)
