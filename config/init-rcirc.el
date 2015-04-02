(use-package rcirc
  :init
  (setq rcirc-default-nick "mahinshaw"
        rcirc-default-user-name "mahinshaw"
        rcirc-default-full-name "Mark Hinshaw"
        rcirc-omit-responses '("JOIN" "PART" "QUIT" "NICK" "AWAY"))

  (setq rcirc-server-alist
        '(("irc.freenode.net" :port 6697 :encryption tls
           :channels ("#emacs" "#clojure")))))

(provide 'init-rcirc)
