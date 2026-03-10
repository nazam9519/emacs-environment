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

(unless (package-installed-p 'company)
  (python-syntaxer-install))
(python-syntaxer)

(if (eq major-mode 'python-mode)
    (message "This is a Python file")
  (message "Not Python"))

(message "python!")
(provide 'set-python)
