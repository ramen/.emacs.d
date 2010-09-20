;;; init-erc.el --- ERC customizations

(setq erc-nick "ramenboy"
      erc-nick-uniquifier "_"
      erc-notice-prefix "# "
      erc-prompt (lambda ()
                   (concat "[" (or (erc-default-target) "ERC") "]")))
