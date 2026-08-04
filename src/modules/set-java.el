;;; set-java.el --- Java language support -*- lexical-binding: t; -*-

(use-package lsp-mode
  :commands lsp-deferred
  :hook (lsp-mode . lsp-enable-which-key-integration))

(use-package lsp-java
  :after lsp-mode
  :hook (java-mode . lsp-deferred))

(use-package dap-java
  :ensure nil
  :after (dap-mode lsp-java))

(defun java-activate ()
  "Load Java language support.

Retained as a compatibility command; Java buffers start LSP automatically."
  (interactive)
  (require 'lsp-java)
  (message "Java support loaded"))

(defun java-time ()
  "Start Java language support in the current buffer."
  (interactive)
  (java-activate)
  (lsp-deferred))

(provide 'set-java)
;;; set-java.el ends here
