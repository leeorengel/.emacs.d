(require 'clojure-mode)
(require 'clojure-mode-extra-font-locking)
(require 'clj-refactor)
(require 'flycheck)
(require 'flycheck-clojure)
(require 'hl-sexp)

(add-hook 'clojure-mode-hook
          (lambda ()
            (clj-refactor-mode 1)
            ;; insert keybinding setup here
            (cljr-add-keybindings-with-prefix "C-c RET")))

;; Enable yassnippet in clojure mode
(add-hook 'clojure-mode-hook #'yas-minor-mode)

(eval-after-load 'flycheck '(flycheck-clojure-setup))
(add-hook 'after-init-hook #'global-flycheck-mode)

;; aggressive indent mode
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)

;; Enable highlighting of current sexp
(add-hook 'clojure-mode-hook #'hl-sexp-mode)
(add-hook 'lisp-mode-hook #'hl-sexp-mode)
(add-hook 'emacs-lisp-mode-hook #'hl-sexp-mode)

;; Idle highlight
;;(defun my-coding-hook ()
;;  (make-local-variable 'column-number-mode)
;;  (column-number-mode t)
;;  (if window-system (hl-line-mode t))
;;  (idle-highlight t))
;;(add-hook 'clojure-mode-hook 'my-coding-hook)

;; no auto sort
(setq cljr-auto-sort-ns nil)

;; do not prefer prefixes when using clean-ns
(setq cljr-favor-prefix-notation nil)

(provide 'setup-clojure-mode)
