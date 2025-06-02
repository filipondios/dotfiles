;; Add to the Emacs path my custom lisp files directory.
(add-to-list 'load-path "~/.emacs.d/lisp")

;; Disable all that backups!
;; Im going to risk it all.
(setq make-backup-files nil
      auto-save-default nil
      delete-old-versions t)

;; Instead of a beep sound, make some
;; window effect at warnings.
(setq visible-bell t)

;; Dont wrap lines
(setq truncate-lines t)

;; Disable initial buffer
(setq inhibit-startup-screen t
      initial-buffer-choice  nil)

;; Show line numbers
(setq display-line-numbers t)
(global-display-line-numbers-mode t)

;; Dont put automatically things in this
;; file. Put those things at other location.
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file t)

;; Change UI font style and size
(set-face-attribute 'default nil :font "Ubuntu Mono Nerd Font" :height 150)

;; Enable smooth scrolling
(setq pixel-scroll-recision-large-scroll-height 50.0)
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)

;; Make ESC quit
(global-set-key (kbd "<scape>") 'keyboard-escape-quit)

;; Add package repositories to Emacs
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			("org" . "https://orgmode.org/elpa/")
			("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))
;(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Custom packages below
;; Buffer seach
(unless (package-installed-p 'swiper)
  (use-package swiper
    :ensure t))

;; Search completion and a best
;; menu for search.
(unless (package-installed-p 'ivy)
  (use-package ivy
    :diminish
    :bind (("C-s" . swiper))
    :config
    (ivy-mode 1)))

;; Evil mode (vim mappings)
(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)
