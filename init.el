;;;;; Startup
;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s seconds with %d garbage collections."
                     (emacs-init-time "%.2f")
                     gcs-done)))

(setq read-process-output-max (* 1024 1024 3)) ;; 1mb

;;;;; Don't show the splash screen
(setq inhibit-startup-message t)

;;;;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)
(scroll-bar-mode -1) ; Remove scroll bar

;;;;; Actually my default theme
(load-theme 'modus-vivendi t)

;;;;; Actual line in focus
(global-hl-line-mode 1)

;;;;; Default font with height 11.5
(set-face-attribute 'default nil :font "JetBrains Mono" :height 115)

;;;;; Initialize package sources
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;;;; Default values insert by emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(vterm rust-mode lsp-ui lsp-mode which-key smartparens smartparens-config highlight-parentheses dumb-jump flycheck aggressive-indent fd-dired dired-rsync dired-git all-the-icons-dired diredfl yasnippet vimish-fold vertico company-box company treemacs-tab-bar treemacs-persp treemacs-magit treemacs-icons-dired treemacs-projectile treemacs-evil treemacs git-gutter git-glutter popup evil-goggles evil-googles nano-modeline doom-themes all-the-icons doom-modeline ligature hl-todo evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-goggles-change-face ((t (:inherit diff-removed))))
 '(evil-goggles-delete-face ((t (:inherit diff-removed))))
 '(evil-goggles-paste-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-add-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-change-face ((t (:inherit diff-changed))))
 '(evil-goggles-undo-redo-remove-face ((t (:inherit diff-removed))))
 '(evil-goggles-yank-face ((t (:inherit diff-changed)))))


;;;;; UI
(use-package hl-todo)
(hl-todo-mode 1)

;; Enable especial characters
(use-package ligature
  :config
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all JetBrains Mono ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("-|" "-~" "---" "-<<" "-<" "--" "->" "->>" "-->" "///" "/=" "/=="
                                      "/>" "//" "/*" "*>" "***" "*/" "<-" "<<-" "<=>" "<=" "<|" "<||"
                                      "<|||" "<|>" "<:" "<>" "<-<" "<<<" "<==" "<<=" "<=<" "<==>" "<-|"
                                      "<<" "<~>" "<=|" "<~~" "<~" "<$>" "<$" "<+>" "<+" "</>" "</" "<*"
                                      "<*>" "<->" "<!--" ":>" ":<" ":::" "::" ":?" ":?>" ":=" "::=" "=>>"
                                      "==>" "=/=" "=!=" "=>" "===" "=:=" "==" "!==" "!!" "!=" ">]" ">:"
                                      ">>-" ">>=" ">=>" ">>>" ">-" ">=" "&&&" "&&" "|||>" "||>" "|>" "|]"
                                      "|}" "|=>" "|->" "|=" "||-" "|-" "||=" "||" ".." ".?" ".=" ".-" "..<"
                                      "..." "+++" "+>" "++" "[||]" "[<" "[|" "{|" "??" "?." "?=" "?:" "##"
                                      "###" "####" "#[" "#{" "#=" "#!" "#:" "#_(" "#_" "#?" "#(" ";;" "_|_"
                                      "__" "~~" "~~>" "~>" "~-" "~@" "$>" "^=" "]#"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

(use-package all-the-icons
  :ensure t)

;; Maybe need to run: all-the-icons-install-fonts
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; evil-goggles-mode displays a visual hint when editing with evil.
(use-package evil-goggles
  :ensure t
  :config
  (evil-goggles-mode)

  ;; optionally use diff-mode's faces; as a result, deleted text
  ;; will be highlighed with `diff-removed` face which is typically
  ;; some red color (as defined by the color theme)
  ;; other faces such as `diff-added` will be used for other actions
  (evil-goggles-use-diff-faces))
(setq evil-goggles-duration 0.100)

(use-package popup)

(use-package git-gutter)
(global-git-gutter-mode +1)

(use-package visual-fill-column)

(use-package writeroom-mode)

;;
(use-package treemacs)

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)
;;

;;;;; Completion
;; Code and text completion with company and company-box
(use-package company)
(global-company-mode +1)

(use-package company-box
  :hook (company-mode . company-box-mode))

;; Command completion with vertico
(use-package vertico
  :init
  (vertico-mode))


;;;;; Editor
;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; File-template not exist. It uses yasnippet to produces the initial content. I do not know how to config this

;; Fold
(use-package vimish-fold)
;(global-set-key (kbd "Spc v f") #'vimish-fold)
;(global-set-key (kbd "<menu> v v") #'vimish-fold-delete)
(vimish-fold-global-mode 1)

(use-package yasnippet)
(yas-global-mode 1)

(use-package doom-snippets
  :load-path "~/.emacs.d/repos/snippets"
  :after yasnippet)


;;;;; Emacs

(use-package diredfl)
(diredfl-global-mode 1) ;?

(use-package all-the-icons-dired)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(use-package dired-git)
(add-hook 'dired-mode-hook 'dired-git-mode)

(use-package dired-rsync
  :config
  (bind-key "C-c C-r" 'dired-rsync dired-mode-map))

(use-package fd-dired)

(use-package aggressive-indent)
(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package dumb-jump)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(use-package projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(use-package highlight-parentheses)
(global-highlight-parentheses-mode +1)
(add-hook 'minibuffer-setup-hook #'highlight-parentheses-minibuffer-setup)

(use-package smartparens)
(smartparens-global-mode +1)

(use-package which-key)
(which-key-mode +1)

;; Prefer shell over other terminals
(use-package vterm)
(evil-define-key 'normal evil-my-paste "p" 'vterm-yank)

;;C-x C-b to list all buffers
;;k to mark buffers for kill (D appears next to buffer)
;;x to execute kill

;;;;; Lang

(use-package rust-mode)

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
	 (rust-mode . lsp)
	 (python-mode . lsp)
         ;; if you want which-key integration
	 (lsp-mode . lsp-enable-which-key-integration)
	 )
  :commands lsp)
(use-package lsp-ui :commands lsp-ui-mode)
