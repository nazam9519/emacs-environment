;;custom-command-list
;;python-syntaxer
(global-set-key (kbd "C-c l") #'toggle-line-numbers)
(global-set-key (kbd "C-x C-l") #'execute-extended-command)
(global-set-key (kbd "C-c m ") #'release-the-evil)
(global-set-key (kbd "C-c e o") (lambda () (interactive) (dired-other-window user-emacs-directory)))
(global-set-key (kbd "C-c e t") (lambda () (interactive) (dired user-emacs-directory)))

(provide 'set-keys)
