(defun kotlin-time ()
(interactive)
(if (null use-package-always-ensure)
    ;;true
    (progn
      (setq use-package-always-ensure t)
   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/")))
      
    ;;false
  (message "variable is not null"))
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-refresh-contents)
(use-package sweet-theme :ensure t :init (load-theme 'sweet t))
(use-package projectile)
(use-package flycheck)
(use-package yasnippet :config (yas-global-mode))
(use-package lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration)))
(use-package hydra)
(use-package company)
(use-package lsp-ui)
(use-package which-key :config (which-key-mode))
(use-package kotlin-mode :ensure t)
;; eglot with kotlin-language-server
(use-package eglot
    :ensure t
    :hook (kotlin-mode . eglot-ensure)
    :config
    (add-to-list 'eglot-server-programs
        '(kotlin-mode . ("kotlin-language-server")))))

(provide 'set-kotlin)
