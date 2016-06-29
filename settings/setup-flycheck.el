(require 'flycheck)
(require 'flycheck-pos-tip)

(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)

(provide 'setup-flycheck)
