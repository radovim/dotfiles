(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(setq vc-follow-symlinks t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(global-display-line-numbers-mode) ; Enable line numbers globally
(setq display-line-numbers-type 'relative)  ; Set to relative
(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font-16"))
(setq inhibit-splash-screen t) ; Disables startup splash screen
(setq tab-width 4)
(add-to-list 'display-buffer-alist
	     '("\\*compilation\\*"
	       display-buffer-below-selected
	       (window-height . 10)
	       (reusable-frames .0)))

(defun smart-beginning-of-line ()
  (interactive)
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point)) (beginning-of-line))))

(global-set-key [remap move-beginning-of-line] 'smart-beginning-of-line)

(setq ido-enable-flex-matching t) ; Enable flaxible matching
(setq ido-everywhere t) ; Enable ido mode for other commands
(ido-mode 'both) ; Use both file and buffer switching

(load-theme 'gruber-darker t)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-,") 'duplicate-line)

(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

(use-package smex :ensure t)
(use-package gruber-darker-theme :ensure t)
