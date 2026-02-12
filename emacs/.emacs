;; xxxxxxxxxxxxxxxxxxxxx
;;    Custom settings
;; xxxxxxxxxxxxxxxxxxxxx

;; Set custom file path and load it
(setq custom-file (make-temp-file "~/.emacs.d/custom.el"))
;; (setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

;; Follow symlink and visits the real file
(setq vc-follow-symlinks t)

;; Disable tool bar
(tool-bar-mode 0)

;; Disable menu bar
(menu-bar-mode 0)

;; Disable scroll bar
(scroll-bar-mode 0)

;; Display column number alongside line number in status line
(column-number-mode t)

;; Enable line numbers globally
(global-display-line-numbers-mode)

;; Set to relative
(setq display-line-numbers-type 'relative)

;; Set some cool font
(add-to-list 'default-frame-alist '(font . "Iosevka NFM-15"))

; Disables startup splash screen
(setq inhibit-splash-screen t)

;; Use 'y' instead of 'yes' and 'n' instead of 'no'
(setopt use-short-answers t)

;; Disable bell(especially important on Windows)
(setq ring-bell-function 'ignore)

;; Enable Upcase and Downcase commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Show current project name on status line
(setq project-mode-line t)

;; Start emacs maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Use spaces for indentation in all modes by default
(setq-default indent-tabs-mode nil)

;; Set the default width for a tab character (display only)
(setq-default tab-width 4)

;; Set the indentation width for C-like modes to 8 spaces
(setq c-basic-offset 4)

;; Set electric pair and indent modes
(electric-pair-mode 1)

;; store auto-saved files in ~/.emacs.d/tmp/auto-saves directory
(setq auto-save-file-name-transforms `((".*" ,(expand-file-name "tmp/auto-saves/" user-emacs-directory) t)))
(unless (file-exists-p (expand-file-name "tmp/auto-saves/" user-emacs-directory))
  (make-directory (expand-file-name "tmp/auto-saves/" user-emacs-directory) t))

;; Show number of matched items during the search
(setq isearch-lazy-count t)

;; Make comilation buffer scroll output as compiling
(setq compilation-scroll-output t)

;; Show compilation window in a horizontal split below
(add-to-list 'display-buffer-alist
         '("\\*compilation\\*"
           display-buffer-below-selected
           (reusable-frames .0)))


;; XXXXXXXXXXXXXXXXXXXXXXXXX
;;      Custom functions
;; XXXXXXXXXXXXXXXXXXXXXXXXX
(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)

  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))


;; XXXXXXXXXXXXXXXXXXXXXXXXX
;;     Custom Keybinding
;; XXXXXXXXXXXXXXXXXXXXXXXXX

;; Use C-, to duplicate current line
(global-set-key (kbd "C-,") 'duplicate-line)
;; Use C-M-z t odiscard all unsaved changes in current buffer
(global-set-key (kbd "C-M-z") 'revert-buffer)
;; Define a key binding for a custom line-duplication command
(global-set-key (kbd "C-,") 'rc/duplicate-line)


;; XXXXXXXXXXXXXXXXXXXXXXXXX
;;      Packages
;; XXXXXXXXXXXXXXXXXXXXXXXXX

;; Add MELPA repo
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Install and set GruberDarker theme
(use-package gruber-darker-theme :ensure t)
(load-theme 'gruber-darker t)

;; Install Magit - git client
(use-package magit :ensure t)

;; Setup ido-mode and smex(Smex is a M-x enhancement)
(ido-mode 1)
(setq ido-enable-flex-matching t) ; Enable flaxible matching
(setq ido-everywhere t) ; Enable ido mode for other commands
(ido-mode 'both) ; Use both file and buffer switching
(use-package smex :ensure t)
(global-set-key (kbd "M-x") 'smex)

(use-package ido-completing-read+
  :ensure t
  :config
  (ido-ubiquitous-mode 1))

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1))

;; Add multiple-cursors package and bind some keybindings
(use-package multiple-cursors :ensure t)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;; Add package for moving lines of text up and down
(use-package move-text
  :ensure t
  :bind
  (("M-<up>" . move-text-up)
   ("M-<down>" . move-text-down)))
