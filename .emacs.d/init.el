;  ____
; |  _ \  _   _  _ __  ___  _ __ ___    __ _   ___  ___
; | |_) || | | || '__|/ _ \| '_ ` _ \  / _` | / __|/ __|
; |  __/ | |_| || |  |  __/| | | | | || (_| || (__ \__ \
; |_|     \__,_||_|   \___||_| |_| |_| \__,_| \___||___/

;; Setup package control
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t) ; Always ensure package is downloaded

;; Essential Settings
(setq inhibit-splash-screen t
    inhibit-startup-message t
    inhibit-startup-echo-area-message t)
(tool-bar-mode -1) ; No toolbar
(scroll-bar-mode -1) ; Hide scrollbars
(menu-bar-mode -1) ; Hide menu bar
(show-paren-mode t) ; Highlights matching parenthesis
(electric-pair-mode t) ; Add closing pairs automatically
(setq initial-scratch-message "") ; No scratch text
(fset 'yes-or-no-p 'y-or-n-p) ; y/n instead of yes/no
(setq-default indent-tabs-mode nil)

;; Org Settings
(setq org-pretty-entities t)

;; Theme
(use-package doom-themes
  :config
  (load-theme 'doom-one t))

;; Nicer Completion
(use-package ido
    :init
    (defun my-ido-keys ()
        "Add keybindings for ido"
        (define-key ido-completion-map [tab] 'ido-next-match))
    (add-hook 'ido-setup-hook #'my-ido-keys)
    :config
    (setq ido-enable-flex-matching t)
    (setq ido-everywhere t)
    (ido-mode 1))

;; Use ido everywhere possible
(use-package ido-ubiquitous
  :config
  (ido-ubiquitous-mode 1))

;; Nicer Completion in M-x
(use-package smex
  :config
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)) ;; This is your old M-x.

;; Intelligently chooses between a space or hyphen when using ido
(use-package ido-complete-space-or-hyphen)

(use-package expand-region
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

;; Git porcelen
(use-package magit
  :config
  (global-set-key "\C-x\g" 'magit-status))

;; Better looking org headers
(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Backup options
(setq backup-by-copying t) ; Stop shinanigans with links
(setq backup-directory-alist '((".*" . "~/.bak.emacs/backup/")))
(if (eq nil (file-exists-p "~/.bak.emacs/auto")) ; Creates auto directory if it doesn't already exist
    (make-directory "~/.bak.emacs/auto"))
(setq auto-save-file-name-transforms '((".*" "~/.bak.emacs/auto/" t))) ; backup in one place. flat, no tree structure
