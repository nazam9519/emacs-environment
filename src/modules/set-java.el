(defun java-time ()
(interactive)
(if (null use-package-always-ensure)
    ;;true
    (progn
      (setq use-package-always-ensure t)
   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/")))
      
    ;;false
  (message "variable is not null"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
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
(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
(use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
(use-package dap-java :ensure nil)
(use-package helm-lsp)
(use-package helm
  :config (helm-mode))
(use-package lsp-treemacs))

(provide 'set-java)
;(require 'evilvim)
;(require 'set-keys)
