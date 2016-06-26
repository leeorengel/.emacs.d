(require 'key-chord)

(key-chord-define-global "jj" 'avy-goto-char)
(key-chord-define-global "jk" 'avy-goto-char-2)
(key-chord-define-global "xx" 'execute-extended-command)

(key-chord-mode 1)

;; Max time delay between two key presses to be considered a key chord
(setq key-chord-two-keys-delay 0.1) ; default 0.1

;; Max time delay between two presses of the same key to be considered a key chord.
;; Should normally be a little longer than `key-chord-two-keys-delay'.
(setq key-chord-one-key-delay 0.2) ; default 0.2

(provide 'setup-key-chord)
