;;; set-editor.el --- Shared editor features -*- lexical-binding: t; -*-

(defun special-glob-editor ()
  "Compatibility entry point for the shared editor setup."
  (interactive)
  (glob-editor-init-parms))

(defun nazam-sethelm ()
  "Enable Helm while retaining the historical buffer-list binding."
  (interactive)
  (helm-mode 1)
  (helm-override-buffer))

(defun glob-editor-init-parms ()
  "Enable shared UI, completion, project, and debugging features."
  (interactive)
  (use-package sweet-theme
    :config (load-theme 'sweet t))

  (use-package projectile
    :config (projectile-mode 1))
  (use-package flycheck
    :hook (prog-mode . flycheck-mode))
  (use-package yasnippet
    :config (yas-global-mode 1))
  (use-package company
    :hook (prog-mode . company-mode)
    :custom
    (company-minimum-prefix-length 1)
    (company-idle-delay 0.0)
    (company-backends '(company-capf)))
  ;; Eglot contributes language-specific completion through CAPF. Emacs Lisp
  ;; already has a native CAPF, so it needs no external language server.
  (use-package eglot
    :ensure nil
    :commands eglot-ensure
    :hook ((sh-mode bash-ts-mode) . eglot-ensure))
  (use-package which-key
    :config (which-key-mode 1))
  (use-package helm
    :config (nazam-sethelm))
  (use-package helm-lsp)
  (use-package lsp-ui)
  (use-package lsp-treemacs)
  (use-package hydra)
  (use-package dap-mode
    :after lsp-mode
    :config (dap-auto-configure-mode 1)))

(provide 'set-editor)
;;; set-editor.el ends here
