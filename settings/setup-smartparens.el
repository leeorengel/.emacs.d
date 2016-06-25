(require 'smartparens)

(require 'smartparens-config)

(add-hook 'lisp-mode-hook #'smartparens-strict-mode)
(add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)

;; Use the keybindings from paredit
(setq sp-base-key-bindings 'paredit)

;; Bind the addtional smart parens keybindings
(sp-use-paredit-bindings)

(setq sp-autoskip-closing-pair 'always)

(setq sp-hybrid-kill-entire-symbol nil)

;; Turn on smartparens everywhere
;; NOTE: may want to only enable it for specific modes in the future
(show-smartparens-global-mode +1)

(provide 'setup-smartparens)
