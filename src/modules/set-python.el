;;; set-python.el --- Python language support -*- lexical-binding: t; -*-

(use-package eglot
  :ensure nil
  :commands eglot-ensure
  :hook ((python-mode python-ts-mode) . eglot-ensure))

(use-package dap-python
  :ensure nil
  :after dap-mode
  :custom (dap-python-debugger 'debugpy))

(defun python-setup ()
  "Configure Python completion and debugging packages."
  (interactive)
  (setq python-shell-interpreter "python3")
  (company-mode 1)
  (eglot-ensure)
  (require 'dap-python))

(defun python-activate-env-emacs ()
  "Activate language-aware completion for the current Python buffer."
  (interactive)
  (python-setup))

(defun python-syntaxer-install ()
  "Install Company and enable it for Python buffers."
  (interactive)
  (package-install 'company)
  (add-hook 'python-mode-hook #'company-mode))

(defun python-syntaxer ()
  "Enable Python completion using Company and Eglot."
  (interactive)
  (setq python-shell-interpreter "python3")
  (company-mode 1)
  (eglot-ensure))

(defun dap-python-enable ()
  "Load Python DAP support using debugpy."
  (interactive)
  (require 'dap-python)
  (setq dap-python-debugger 'debugpy)
  (message "Python DAP support enabled"))

(provide 'set-python)
;;; set-python.el ends here
