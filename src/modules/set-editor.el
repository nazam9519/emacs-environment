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
    (use-package lsp-treemacs)
)

(defun glob-editor-init-parms ()
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
    (use-package company)
    (use-package lsp-ui)

    (use-package which-key
    :config
    (which-key-mode 1))

    (use-package helm
    :config
    (helm-mode 1))

    (use-package helm-lsp)
    (use-package lsp-treemacs)

    (use-package dap-mode
    :after lsp-mode
    :config
    (dap-auto-configure-mode 1))

    (use-package dap-java
      :ensure nil))

(provide 'set-editor)
