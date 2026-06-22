(add-to-list 'load-path (concat user-emacs-directory ".config"))
;(add-to-list 'package-archives
;             '("melpa" . "https://melpa.org/packages/")
;             t)
(add-to-list 'default-frame-alist '(fullscreen . fullboth))
(setq inhibit-startup-screen t)

(require 'package)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t)
(require 'settings)  ;config settings
(require 'evilvim)   ;vim editor enablement and toggle
(require 'set-java)
(require 'set-keys)  ;set control characters
(require 'commandhelpers) ;help-commands
(require 'set-python)
;;(require 'set-kotlin)
(require 'set-editor)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(deeper-blue))
 '(package-selected-packages
   '(company dap-mode evil flycheck helm-lsp hydra kotlin-mode lsp-java
	     lsp-mode lsp-treemacs lsp-ui projectile sweet-theme vterm
	     yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;(add-hook
;; 'window-buffer-change-functions
 ;;(lambda (_frame)
  ;; (let ((entry (car (window-prev-buffers))))
;;     (when entry
 ;;      (let ((prev-buffer (car entry)))
;;	 (setq nazam-last-buffer prev-buffer)
;;	 (when (getenv "DEBUG")
;;	   (message "%s" prev-buffer))))))



(glob-editor-init-parms)
(when(getenv "JAVAMACS")
  (message "setting java mode")
  (java-activate)
  (java-time))

(when(getenv "EVILMACS")
  (release-the-evil)
  (message "setting vi mode to on"))

(when(getenv "KOTMACS")
  (message "setting kotlin mode")
  (kotlin-time))
;;(special-glob-editor)

(when (getenv "DEBUG")
  (message "Starting with debug message window")
  (debug-emacs-msgs))
