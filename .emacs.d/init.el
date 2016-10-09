(package-initialize)

(org-babel-load-file "~/puremacs/README.org")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company neotree spaceline web-mode use-package tablist smex s powerline php+-mode org-bullets magit let-alist ido-ubiquitous ido-complete-space-or-hyphen haskell-mode expand-region doom-themes ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#343e48"))))
 '(company-scrollbar-fg ((t (:background "#293139"))))
 '(company-tooltip ((t (:inherit default :background "#232a30"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face)))))
