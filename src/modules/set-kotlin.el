;;; set-kotlin.el --- Kotlin language support -*- lexical-binding: t; -*-

(use-package kotlin-mode
  :mode "\\.kts?\\'")

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(kotlin-mode . ("kotlin-language-server"))))

(add-hook 'kotlin-mode-hook #'eglot-ensure)

(defun kotlin-time ()
  "Start Kotlin language support in the current buffer."
  (interactive)
  (eglot-ensure))

(provide 'set-kotlin)
;;; set-kotlin.el ends here
