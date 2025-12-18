(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(load-theme 'gruber-darker t)
(global-display-line-numbers-mode) ; Enable line numbers globally
(setq display-line-numbers-type 'relative)  ; Set to relative
(add-to-list 'default-frame-alist '(font . "Iosevka NFM"))
(setq inhibit-splash-screen t) ; Disables startup splash screen
(setq tab-width 4)

(ido-mode 1)
(setq ido-enable-flex-matching t) ; Enable flaxible matching
(setq ido-everywhere t) ; Enable ido mode for other commands
(ido-mode 'both) ; Use both file and buffer switching

(use-package smex :ensure t)
(use-package gruber-darker-theme :ensure t)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-,") 'duplicate-line)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)



