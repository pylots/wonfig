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
    ponylang-mode
    )
  )

;; Scans the list in local-packages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      local-packages)

;; ====================================
;; Basic Customization
;; ====================================

(setq inhibit-startup-message t)  ;; Hide the startup message
(setq dired-use-ls-dired nil)
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))
; (global-linum-mode t)             ;; Enable line numbers globally
(set-frame-font "monaco")
(tool-bar-mode -1)
(setq-default indent-tabs-mode nil)
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(add-to-list 'default-frame-alist '(height . 42))
(add-to-list 'default-frame-alist '(width . 120))
(setq grep-command "grep -rni ")

;; ====================================
;; DEVELOPMENT SETUP
;; ====================================
;; Enable elpy
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
   (quote
    (ponylang-mode ## magit blacken ein skewer-mode request python-mode py-autopep8 projectile polymode markdown-mode jedi flycheck elpy better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
