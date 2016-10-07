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

(add-to-list 'auto-mode-alist
  '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
  '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))
