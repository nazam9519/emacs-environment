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
  "Compatibility alias for `python-setup'."
  (interactive)
  (python-setup))

(defun python-syntaxer-install ()
  "Compatibility entry point for `python-setup'."
  (interactive)
  (python-setup))

(defun python-syntaxer ()
  "Compatibility entry point for `python-setup'."
  (interactive)
  (python-setup))

(defun dap-python-enable ()
  "Load Python DAP support using debugpy."
  (interactive)
  (require 'dap-python)
  (setq dap-python-debugger 'debugpy)
  (message "Python DAP support enabled"))

(provide 'set-python)
;;; set-python.el ends here
