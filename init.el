;; no menu bar
(menu-bar-mode -1)

;; Disable tool bar
(tool-bar-mode -1)

;; disable scroll bars
(scroll-bar-mode -1)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package doom-themes
	:ensure t
  :config (load-theme 'doom-one t))

(use-package evil
  :ensure t
  ;:init (setq evil-want-C-u-scroll t)
  :config (progn
	    (evil-mode 1)
            (defalias #'forward-evil-word #'forward-evil-symbol)))

(use-package magit
  :ensure t
  :init (add-hook 'after-save-hook 'magit-after-save-refresh-status))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(add-to-list 'auto-mode-alist
  '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
  '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0)
 '(package-selected-packages
   (quote
    (robe smex counsel swiper ## alchemist use-package magit evil doom-themes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'after-init-hook 'global-company-mode)

(use-package elixir-mode
  :ensure t)

(use-package alchemist
  :ensure t
  :config (setq alchemist-mix-test-default-options "--no-start"))

(use-package swiper
  :ensure t)

(use-package smex
  :ensure t)

(use-package counsel
  :ensure t
  :bind ("M-x" . counsel-M-x))

(use-package ivy
  :ensure t
  :init (setq ivy-use-virtual-buffers t
                ivy-height 10
                ivy-count-format "(%d/%d) ")
  :bind (("C-c C-r" . ivy-resume)
         :map ivy-minibuffer-map ("RET" . ivy-alt-done))
  :config (ivy-mode 1))

(use-package company
  :ensure t
  :init (global-company-mode))

(use-package robe
  :ensure t
  :init (add-hook 'ruby-mode-hook 'robe-mode))
