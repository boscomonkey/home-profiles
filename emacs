;; ____________________________________________________________________________
;; Aquamacs custom-file warning:
;; Warning: After loading this .emacs file, Aquamacs will also load
;; customizations from `custom-file' (customizations.el). Any settings there
;; will override those made here.
;; Consider moving your startup settings to the Preferences.el file, which
;; is loaded after `custom-file':
;; ~/Library/Preferences/Aquamacs Emacs/Preferences
;; _____________________________________________________________________________
(auto-fill-mode -1)
(global-auto-revert-mode t)
(global-visual-line-mode nil)
(remove-hook 'html-helper-mode-hook 'auto-detect-wrap)
(remove-hook 'html-mode-hook #'turn-on-auto-fill)
(remove-hook 'html-mode-hook #'visual-line-mode)
(remove-hook 'markdown-mode-hook #'turn-on-auto-fill)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)
(remove-hook 'text-mode-hook 'auto-detect-wrap)
(setq-default indent-tabs-mode nil)

;; Split my windows vertically, not horizontally
;; See the function `split-window-sensibly' in window.el
(setq split-width-threshold nil)

;; use CSS major mode for .scss files
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))

;; yaml mode - https://github.com/yoshiki/yaml-mode
(add-to-list 'load-path "~/.emacs.d/yaml-mode/")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
