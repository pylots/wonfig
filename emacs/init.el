;;WONFIG emacs
;;; Code:
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'package)
(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(set-frame-font "monaco")
(tool-bar-mode -1)
(setq-default indent-tabs-mode nil)

(require 'ido)
(ido-mode t)
(icomplete-mode 1)
(server-start)
(x-focus-frame nil)

(when (not package-archive-contents)
  (package-refresh-contents))

(require 'sr-speedbar)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)

(defvar myPackages
  '(better-defaults
    elpy
    flycheck
    py-autopep8
    ))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

(setq inhibit-startup-message t) ;; hide the startup message
(elpy-enable)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (neotree jedi elpy better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
