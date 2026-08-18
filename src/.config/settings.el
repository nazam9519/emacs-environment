;;; settings.el --- General portable settings -*- lexical-binding: t; -*-

(defun setup-backups ()
  "Store backup and auto-save files under the Emacs directory."
  (let ((backup-dir (expand-file-name ".emacs_backups/" user-emacs-directory)))
    (make-directory backup-dir t)
    (setq backup-directory-alist `(("." . ,backup-dir))
          backup-by-copying t
          delete-old-versions t
          kept-new-versions 3
          kept-old-versions 1
          version-control t
          auto-save-file-name-transforms `((".*" ,backup-dir t))
          lock-file-name-transforms `((".*" ,backup-dir t)))))

(defun restore-vanilla-config ()
  "Reload this Emacs configuration.

The historical command name is retained for compatibility."
  (interactive)
  (load-file (expand-file-name "init.el" user-emacs-directory)))

(defconst emacs-config-dir user-emacs-directory)
(add-to-list 'load-path (expand-file-name "modules" emacs-config-dir))

(setup-backups)

;; Keep settings written by Customize separate from the hand-written startup
;; files.  The file is optional until Customize first saves something.
(setq custom-file (expand-file-name ".config/custom.el" emacs-config-dir))
(load custom-file 'noerror)
(provide 'settings)
;;; settings.el ends here
