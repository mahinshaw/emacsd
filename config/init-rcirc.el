(require 'rcirc)

(setq rcirc-default-nick "mahinshaw")

(setq rcirc-server-alist
      '(("irc.freenode.net" :port 6697 :encryption tls
         :channels ("#emacs" "#clojure"))))

(provide 'init-rcirc)
