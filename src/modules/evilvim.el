(require 'use-package)
(defun release-the-evil ()
  "toggle on and off of evil(vi mode)"
  (interactive)
  (use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (if evil-mode
    (progn
	(message "turning off evil mode")
	(evil-mode 0))
    (progn
      (message "turning on evil mode")
      (evil-mode 1)))))
;;
  
(defun toggle-line-numbers ()
  "Toggle between absolute and relative line numbers."
  (interactive)
  (setq display-line-numbers-type
        (if (eq display-line-numbers-type 'relative)
            t
          'relative))
  (global-display-line-numbers-mode 0)
  (global-display-line-numbers-mode 1))

;;code starts					
;(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)
;(release-the-evil)



(provide 'evilvim)
