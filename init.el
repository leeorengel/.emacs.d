;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Set up appearance early
(require 'appearance)

;; Settings for currently logged in user
(setq user-settings-dir
      (concat user-emacs-directory "users/" user-login-name))
(add-to-list 'load-path user-settings-dir)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(magit
     switch-window
     key-chord
     avy
     inflections
     hydra
     idle-highlight-mode
     fullframe
     beacon
     move-text
     gist
     git-timemachine
     neotree
     htmlize
     visual-regexp
     markdown-mode
     fill-column-indicator
     expand-region
     flycheck
     flycheck-pos-tip
     which-key
     multiple-cursors
     flx
     f
     flx-ido
     ido-describe-bindings
     dired-details
     projectile
     ido-vertical-mode
     ido-at-point
     simple-httpd
     nodejs-repl
     restclient
     hl-sexp
     highlight-escape-sequences
     whitespace-cleanup-mode
     elisp-slime-nav
     dockerfile-mode
     company
     company-flx
     clojure-mode
     clojure-mode-extra-font-locking
     clj-refactor
     rainbow-delimiters
     aggressive-indent
     flycheck-clojure
     dumb-jump
     workgroups2
     cider
     yasnippet
     smartparens
     edn
     prodigy
     string-edit
     crux
     ggtags
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Lets start with a smattering of sanity
(require 'sane-defaults)

;; Setup environment variables from the user's shell.
(when is-mac
  (require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

;; which-key - a better guide-key
(require 'which-key)
(which-key-mode)

(require 'dumb-jump)
(dumb-jump-mode)

;;fullframe
(require 'fullframe)
(fullframe magit-status magit-mode-quit-window)

;; beacon
(beacon-mode 1)

;; Setup extensions
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'org '(require 'setup-org))
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'magit '(require 'setup-magit))
(eval-after-load 'grep '(require 'setup-rgrep))
(eval-after-load 'shell '(require 'setup-shell))
(require 'setup-neotree)
(require 'setup-projectile)
(require 'setup-key-chord)
(require 'setup-smartparens)
(require 'setup-rainbow-delimiters)
(require 'setup-company)
(require 'setup-hippie)
(require 'setup-yasnippet)
(require 'setup-workgroups2)
(require 'multiple-cursors)

;; Font lock dash.el
(eval-after-load "dash" '(dash-enable-font-lock))

;; Language specific setup files
(eval-after-load 'clojure-mode '(require 'setup-clojure-mode))
(eval-after-load 'clojure-mode '(require 'setup-cider))
(eval-after-load 'markdown-mode '(require 'setup-markdown-mode))

(autoload 'auto-complete-mode "auto-complete" nil t)
(eval-after-load 'flycheck '(require 'setup-flycheck))
(eval-after-load 'flycheck '(flycheck-clojure-setup))
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Map files to modes
(require 'mode-mappings)

;; Highlight escape sequences
(require 'highlight-escape-sequences)
(hes-mode)
(put 'font-lock-regexp-grouping-backslash 'face-alias 'font-lock-builtin-face)

;; Visual regexp
(require 'visual-regexp)
(define-key global-map (kbd "M-&") 'vr/query-replace)
(define-key global-map (kbd "M-/") 'vr/replace)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(require 'delsel)
(require 'jump-char)
(require 'wgrep)
(require 'smart-forward)
(require 'change-inner)
(require 'multifiles)
(require 'crux)

;; nice jumper
(require 'nice-jumper)
(nice-jumper-mode t)

;; Fill column indicator
(require 'fill-column-indicator)
(setq fci-rule-color "#111122")

;; Browse kill ring
(require 'browse-kill-ring)
(setq browse-kill-ring-quit-action 'save-and-restore)

;; Smart M-x is smart
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; Setup key bindings
(require 'key-bindings)

;; Misc
(require 'project-archetypes)
(require 'my-misc)
(when is-mac (require 'mac))

;; Elisp go-to-definition with M-. and back again with M-,
(autoload 'elisp-slime-nav-mode "elisp-slime-nav")
(add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t) (eldoc-mode 1)))

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Conclude init by setting up specifics for the current user
(when (file-exists-p user-settings-dir)
  (mapc 'load (directory-files user-settings-dir nil "^[^#].*el$")))

;; Enable full-screen by default on startup
(toggle-frame-maximized)

; Set highlight exceeding character limit to 120 rather than 80
(setq whitespace-line-column 120)
