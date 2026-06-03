(defun python-activate-env-emacs ()
  (unless (package-installed-p 'company)
    (python-syntaxer-install))
  (python-syntaxer)
  (dap-python-enable))

(defun python-syntaxer-install ()
  (interactive)
  (package-install 'company)

  (add-hook 'python-mode-hook 'company-mode))

(defun python-syntaxer ()
  (interactive)
  (add-hook 'python-mode-hook 'company-mode)
  (setq python-shell-interpreter "python3")
  (require 'company)
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.0)
  (setq company-backends '(company-capf))
  (add-hook 'python-mode-hook 'eglot-ensure))

(defun dap-python-enable()
  (interactive)
  (message "enable dap for a python file")
  (use-package dap-mode
    :ensure t
    :config
    (dap-auto-configure-mode))
  (require 'dap-python)
  (setq dap-python-debugger 'debugpy))


(add-hook 'python-mode-hook #'python-activate-env-emacs)
;;(add-hook 'python-mode-hook 'company-mode)
;;(if (eq major-mode 'python-mode)
;;(python-activate-env-emacs))
;;    (message "This is a Python file")
;;  (message "Not Python"))
   


(provide 'set-python)
