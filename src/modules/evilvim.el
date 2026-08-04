;;; evilvim.el --- Optional Evil support -*- lexical-binding: t; -*-

(defun comms ()
  "Install the historical custom Evil Ex commands."
  (interactive)
  (with-eval-after-load 'evil
    (evil-ex-define-cmd "java-mode" #'java-time)
    (evil-ex-define-cmd "restore-vanilla-emacs" #'restore-vanilla-config)
    (evil-ex-define-cmd "el[isp]" #'eval-expression)
    (evil-ex-define-cmd "eval" #'eval-expression)))

(defun release-the-evil ()
  "Toggle Evil (Vim emulation) globally."
  (interactive)
  (use-package evil
    :init
    (setq evil-want-C-u-scroll t
          evil-want-C-i-jump nil)
    :config
    (evil-mode (if evil-mode -1 1)))
  (comms)
  (message "Evil mode %s" (if evil-mode "enabled" "disabled")))

(defun toggle-line-numbers ()
  "Toggle between absolute and relative line numbers."
  (interactive)
  (setq display-line-numbers-type
        (if (eq display-line-numbers-type 'relative) t 'relative))
  (global-display-line-numbers-mode 1))

(global-display-line-numbers-mode 1)

(provide 'evilvim)
;;; evilvim.el ends here
