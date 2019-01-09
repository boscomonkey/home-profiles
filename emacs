(auto-fill-mode -1)
(global-auto-revert-mode t)
(remove-hook 'html-helper-mode-hook 'auto-detect-wrap)
(remove-hook 'html-mode-hook #'turn-on-auto-fill)
(remove-hook 'markdown-mode-hook #'turn-on-auto-fill)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)
(remove-hook 'text-mode-hook 'auto-detect-wrap)
(setq-default indent-tabs-mode nil)

;; Split my windows vertically, not horizontally
;; See the function `split-window-sensibly' in window.el
(setq split-width-threshold nil)
