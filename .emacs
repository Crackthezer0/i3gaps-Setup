(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)


(require 'color-theme-sanityinc-tomorrow)

(require 'evil)
(evil-mode t)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;;(require 'powerline)
;;(powerline-default-theme)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "cd4d1a0656fee24dc062b997f54d6f9b7da8f6dc8053ac858f15820f9a04a679" "d79ece4768dfc4bab488475b85c2a8748dcdc3690e11a922f6be5e526a20b485" default)))
 '(package-selected-packages
   (quote
    (org-caldav color-theme-sanityinc-tomorrow gruvbox-theme monokai-theme darkmine-theme org-pomodoro smart-mode-line-powerline-theme powerline-evil)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2d2d2d" :foreground "#cccccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 122 :width normal :foundry "NATH" :family "Office Code Pro")))))

(setq org-agenda-files (list "~/Nextcloud/Documents/Notes/learning.org"
			     "~/Nextcloud/Documents/Notes/Rhodes.org"
			     "~/Nextcloud/Documents/Notes/tasks.org"
			     "~/Nextcloud/Documents/Notes/collegecal.org"))
(tool-bar-mode -1)

(add-hook 'prog-mode-hook 'linum-mode)
