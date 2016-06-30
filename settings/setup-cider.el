(require 'cider)
(require 'company)
(require 'flycheck-clojure)

;; company mode for completion
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

;; nice pretty printing
(setq cider-repl-use-pretty-printing t)

;; nicer font lock in REPL
(setq cider-repl-use-clojure-font-lock t)

;; result prefix for the REPL
(setq cider-repl-result-prefix ";; => ")

;; never ending REPL history
(setq cider-repl-wrap-history t)

;; looong history
(setq cider-repl-history-size 3000)

;; REPL history file
(setq cider-repl-history-file "~/.emacs.d/cider-history")

(setq cider-pprint-fn 'pprint)

;; Don't warn me about the dangers of clj-refactor, fire the missiles!
(setq cljr-warn-on-eval nil)

;; Hide nrepl buffers when switching buffers (switch to by prefixing with space)
(setq nrepl-hide-special-buffers t)

;; Enable error buffer popping also in the REPL:
(setq cider-repl-popup-stacktraces t)

;; auto-select the error buffer when it's displayed
(setq cider-auto-select-error-buffer t)

;; Prevent the auto-display of the REPL buffer in a separate window after connection is established
;;(setq cider-repl-pop-to-buffer-on-connect nil)

;; Don't prompt for symbols
(setq cider-prompt-for-symbol nil)

(add-hook 'cider-mode-hook 'my-cider-mode-enable-flycheck)

(provide 'setup-cider)
