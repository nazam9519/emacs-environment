(defun custom-command-list ()
  (interactive)
  (find-file-other-window "~/.emacs.d/modules/set-keys.el"))

(defun debug-emacs-msgs ()
  (interactive)
  (let ((main-window (selected-window))
	(messages (get-buffer "*Messages*")))
    (when messages
      (let ((msg-window (split-window-right)))
	(set-window-buffer msg-window messages)
	(select-window main-window)))))
;;  (split-window-right)
 ;; (other-window 1)
 ;; (switch-to-buffer "*Messages*")
  ;;(other-window -1))
  ;;(pop-to-buffer "*Messages*"))

(provide 'commandhelpers)
