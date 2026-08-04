;;; init.el --- Portable Emacs configuration -*- lexical-binding: t; -*-

;; Keep local configuration modules relative to `user-emacs-directory', so the
;; same directory can be copied or symlinked on macOS or Linux.
(add-to-list 'load-path (expand-file-name ".config" user-emacs-directory))

(add-to-list 'default-frame-alist '(fullscreen . fullboth))
(setq inhibit-startup-screen t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
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

(custom-set-variables
 '(package-selected-packages
   '(company dap-mode evil flycheck helm-lsp hydra kotlin-mode lsp-java
             lsp-mode lsp-treemacs lsp-ui projectile sweet-theme vterm
             yasnippet)))
(custom-set-faces)

(glob-editor-init-parms)

;; Evil is the default editing style. `release-the-evil' remains available as
;; an interactive toggle after startup.
(release-the-evil)

;; These environment switches are retained for compatibility with existing
;; launch scripts. Language support is also selected automatically per buffer.
(when (getenv "JAVAMACS")
  (message "Java support is enabled"))

(when (getenv "EVILMACS")
  (message "EVILMACS detected; Vi mode is already enabled by default"))

(when (getenv "KOTMACS")
  (message "Kotlin support is enabled"))

(when (getenv "DEBUG")
  (message "Starting with debug message window")
  (debug-emacs-msgs))

;;; init.el ends here
