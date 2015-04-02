(use-package ispell
  :init
  (when 'is-windows
    (add-to-list 'exec-path "c:/Program Files (x86)/Aspell/bin/"))

  (setq ispell-program-name "aspell"
        ispell-personal-dictionary "en_US"
        ispell-extra-args '("--sug-mode=ultra")))

(provide 'init-spell)
