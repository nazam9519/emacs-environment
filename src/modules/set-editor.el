(defun special-glob-editor ()
    (use-package sweet-theme :ensure t :init (load-theme 'sweet t))
    (use-package projectile)
    (use-package flycheck)
    (use-package yasnippet :config (yas-global-mode))
    (use-package lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration)))
    (use-package hydra)
    (use-package company)
    (use-package lsp-ui)
    (use-package which-key :config (which-key-mode))
    (use-package helm-lsp)
    (use-package helm
    :config (helm-mode))
    (use-package lsp-treemacs))

(defun nazam-sethelm ()
  (interactive)
  (use-package helm
    :ensure t
    :config
    (helm-mode)
    (helm-override-buffer)))
;;    (global-set-key (kbd "C-x C-b") 'switch-to-buffer))
  
(defun glob-editor-init-parms ()
    (interactive)
    (use-package sweet-theme
    :ensure t
    :config
    (load-theme 'sweet t))

    (use-package projectile)
    (use-package flycheck)
    (use-package yasnippet
    :config
    (yas-global-mode 1))

    (use-package hydra)
    ;;   (use-package company)
    (use-package company
     :ensure t
     :config
     (global-company-mode 1)
     (setq company-minimum-prefix-length 1)
     (setq company-idle-delay 0.0)
     (setq company-backends '(company-capf)))

    (use-package lsp-ui)

    (use-package which-key
    :config
    (which-key-mode 1))

    ;;(use-package helm
     ;; :ensure t
      ;;:config
      ;;(helm-mode 1))
    (nazam-sethelm)
    (use-package helm-lsp)
    (use-package lsp-treemacs)

    (use-package dap-mode
    :after lsp-mode
    :config
    (dap-auto-configure-mode 1))

    (use-package dap-java
      :ensure nil))

(provide 'set-editor)
