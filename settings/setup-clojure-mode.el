(require 'clojure-mode)
(require 'clojure-mode-extra-font-locking)
(require 'clj-refactor)
(require 'cider)

(setq cider-pprint-fn 'pprint)

(require 'core-async-mode)

;; Don't warn me about the dangers of clj-refactor, fire the missiles!
(setq cljr-warn-on-eval nil)

;; Hide nrepl buffers when switching buffers (switch to by prefixing with space)
(setq nrepl-hide-special-buffers t)

;; Enable error buffer popping also in the REPL:
(setq cider-repl-popup-stacktraces t)

;; Specify history file
(setq cider-history-file "~/.emacs.d/nrepl-history")

;; auto-select the error buffer when it's displayed
(setq cider-auto-select-error-buffer t)

;; Prevent the auto-display of the REPL buffer in a separate window after connection is established
(setq cider-repl-pop-to-buffer-on-connect nil)

;; Pretty print results in repl
(setq cider-repl-use-pretty-printing t)

;; Don't prompt for symbols
(setq cider-prompt-for-symbol nil)

(require 'flycheck-clojure)

(add-hook 'cider-mode-hook 'my-cider-mode-enable-flycheck)

(provide 'setup-clojure-mode)
