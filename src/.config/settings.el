;(require 'use-package)
(defun setup-backups ()
  "Configure Emacs backups."
  (setq backup-directory-alist '(("." . "~/.emacs.d/.emacs_backups"))
        backup-by-copying t
        delete-old-versions t
        kept-new-versions 3
        kept-old-versions 1
        version-control t)
  
  (setq auto-save-file-name-transforms `((".*" "~/.emacs.d/.emacs_backups" t))))

(setq emacs-config-dir user-emacs-directory)
(add-to-list 'load-path
             (expand-file-name "modules" emacs-config-dir))

(setup-backups)
;; (setq backup-directory-alist
;;       `(("." . "~/.emacs_backups")))
(provide 'settings)
