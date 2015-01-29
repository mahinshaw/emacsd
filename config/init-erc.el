(require 'erc)

(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
      '((".*\\.freenode.net" "#emacs" "#clojure")))

(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                "324" "329" "332" "333" "353" "477"))

(setq erc-hide-list '("Join" "NICK" "PART" "QUIT"))

(provide 'init-erc)
