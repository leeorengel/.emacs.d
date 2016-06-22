(require 'neotree)

(global-set-key [f8] 'neotree-toggle)

;; Every time when the neotree window is opened, let it find current file and jump to node.
(setq neo-smart-open t)
(setq-default neo-show-hidden-files t)

(provide 'setup-neotree)
