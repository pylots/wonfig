;;WONFIG emacs
;; .emacs.d/init.el

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Installs packages
;;
;; myPackages contains a list of package names
(defvar local-packages
  '(better-defaults                 ;; Setup some better Emacs defaults
    projectile
    elpy                            ;; Emacs Lisp Python Environment
    ein                             ;; Emacs iPython Notebook
    flycheck                        ;; On the fly syntax checking
    py-autopep8                     ;; Run autopep8 on save
    blacken                         ;; Black formatting on save
    magit                           ;; Git integration
    )
  )
(setq backup-by-copying t)
(make-directory "~/.emacs.d/backups/" t)
(make-directory "~/.emacs.d/autosave/" t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/autosave/" t)))
(setq backup-directory-alist '(("." . "~/.emacs.d/backups/")))
(setq sentence-end-double-space nil)
(setq require-final-newline t)
(setq dtrt-indent-global-mode t)
(setq frame-inhibit-implied-resize t)
(setq pixel-scroll-precision-mode t)
(setq show-trailing-whitespace t)

;; Scans the list in local-packages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      local-packages)

;; ====================================
;; Basic Customization
;; ====================================

(load-theme 'solarized-light t)
(setq inhibit-startup-message t)  ;; Hide the startup message
(setq dired-use-ls-dired nil)
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))
(menu-bar-mode 0)
(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))
(setq inhibit-startup-screen t)
(column-number-mode)
; (global-linum-mode t)             ;; Enable line numbers globally
(set-frame-font "monaco")
(tool-bar-mode -1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq show-paren-delay 0)
(show-paren-mode)
(setq create-lockfiles nil)
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(add-to-list 'default-frame-alist '(height . 42))
(add-to-list 'default-frame-alist '(width . 120))
(setq grep-command "grep -rni ")

;; Interactively do things.
(ido-mode 1)
(ido-everywhere)
(setq ido-enable-flex-matching t)
(fido-mode)

;; Show stray whitespace.
(setq-default show-trailing-whitespace t)
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'left)

;; ====================================
;; DEVELOPMENT SETUP
;; ====================================
;; Enable elpy
(setq elpy-rpc-python-command "python3")
(elpy-enable)

;; Use IPython for REPL
;; (setq python-shell-interpreter "jupyter"
;;       python-shell-interpreter-args "console --simple-prompt"
;;       python-shell-prompt-detect-failure-warning nil)
;; (add-to-list 'python-shell-completion-native-disabled-interpreters
;;              "jupyter")
 
;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable Autopep8
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; User-Defined init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(markdown markdown-preview-mode elpygen ponylang-mode ## magit blacken ein skewer-mode request python-mode py-autopep8 projectile polymode markdown-mode jedi flycheck elpy better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
