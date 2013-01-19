;;; init-erc.el --- ERC customizations

(setq erc-email-userid "ramen"
      erc-format-nick-function 'erc-format-@nick
      erc-nick "ramenboy"
      erc-nick-uniquifier "_"
      erc-notice-prefix "# "
      erc-prompt (lambda () (concat "[" (or (erc-default-target) "ERC") "]"))
      erc-user-full-name "Dave Benjamin")
