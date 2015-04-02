(use-package erc
  :init
  (erc-autojoin-mode t)
  (erc-track-mode t)
  (setq erc-autojoin-channels-alist
        '((".*\\.freenode.net" "#emacs" "#clojure")))
  (setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                  "324" "329" "332" "333" "353" "477"))
  (setq erc-hide-list '("Join" "NICK" "PART" "QUIT")))

(provide 'init-erc)
