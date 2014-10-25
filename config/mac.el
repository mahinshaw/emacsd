;;change the command key to the meta key
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;; dont use native full screen
(setq ns-use-native-fullscreen nil)

;; start in fullscreen
(toggle-frame-fullscreen)

(provide 'mac)
