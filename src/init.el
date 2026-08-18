;;; init.el --- Portable Emacs configuration -*- lexical-binding: t; -*-

;; Keep local configuration modules relative to `user-emacs-directory', so the
;; same directory can be copied or symlinked on macOS or Linux.
(add-to-list 'load-path (expand-file-name ".config" user-emacs-directory))

(add-to-list 'default-frame-alist '(fullscreen . fullboth))
(setq inhibit-startup-screen t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; `use-package' is bundled with Emacs 29 and newer.  Package installation is
;; still handled by individual declarations, but startup no longer refreshes
;; the archive merely to bootstrap the configuration machinery.
(require 'use-package)
(setq use-package-always-ensure t)

(require 'settings)
(require 'set-editor)
(require 'set-java)
(require 'set-python)
(require 'set-kotlin)
(require 'evilvim)
(require 'set-keys)
(require 'commandhelpers)

(glob-editor-init-parms)

;; Evil is the default editing style. `release-the-evil' remains an interactive
;; toggle, while reloading this file always leaves Evil enabled.
(enable-evil)

(when (getenv "DEBUG")
  (message "Starting with debug message window")
  (debug-emacs-msgs))

;;; init.el ends here
