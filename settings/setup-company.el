(require 'company)

(global-company-mode)

(with-eval-after-load 'company
  (company-flx-mode +1))

(provide 'setup-company)
