(require 'workgroups2)

(setq wg-session-file "~/.emacs.d/.emacs_workgroups")

(setq wg-emacs-exit-save-behavior           'save)
(setq wg-workgroups-mode-exit-save-behavior 'save)

;; Enable workgroups
(workgroups-mode 1)


(provide 'setup-workgroups2)
