;;; set-keys.el --- Custom global and Dired keys -*- lexical-binding: t; -*-

(require 'dired)

(defun helm-override-buffer ()
  (interactive)
  (if (bound-and-true-p helm-mode)
      (global-set-key (kbd "C-x C-b") 'switch-to-buffer)
    (global-set-key (kbd "C-x C-b") 'list-buffers)
    ))

(defun dired-tab-behavior ()
  "Move to first filename char on current line, then next line."
  (interactive)
  (let ((filename-start (save-excursion (dired-move-to-filename) (point))))
    (if (>= (point) filename-start)
	(progn
	  (dired-next-line 1)
	  (dired-move-to-filename))
      (dired-move-to-filename))))

(defun dired-tab-back ()
  "Move to the filename on the preceding Dired line."
  (interactive)
  (dired-next-line -1)
  (dired-move-to-filename))

(defun buffer-swap-chain ()
  "Switch to the most recently used buffer.

The historical command name and F9 binding are retained."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) t)))
(global-set-key (kbd "M-n") #'forward-to-word)
(global-set-key (kbd "C-c l") #'toggle-line-numbers)
(global-set-key (kbd "C-x C-l") #'execute-extended-command)
(global-set-key (kbd "C-c m ") #'release-the-evil)
(global-set-key (kbd "<f9>") #'buffer-swap-chain)
(global-set-key (kbd "C-c e o") (lambda ()
				  (interactive)
				  (dired-other-window user-emacs-directory)))
(global-set-key (kbd "C-c e t") (lambda ()
				  (interactive)
				  (dired user-emacs-directory)))

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "TAB") #'dired-tab-behavior)
  (define-key dired-mode-map (kbd "<backtab>") #'dired-tab-back))

(provide 'set-keys)
;;; set-keys.el ends here
