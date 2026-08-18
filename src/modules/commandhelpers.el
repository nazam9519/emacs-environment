;;; commandhelpers.el --- Small interactive helpers -*- lexical-binding: t; -*-

(defun custom-command-list ()
  "Open the custom key definitions in another window."
  (interactive)
  (find-file-other-window
   (expand-file-name "modules/set-keys.el" user-emacs-directory)))

(defun debug-emacs-msgs ()
  (interactive)
  (let ((main-window (selected-window))
	(messages (get-buffer "*Messages*")))
    (when messages
      (let ((msg-window (split-window-right)))
	(set-window-buffer msg-window messages)
	(select-window main-window)))))

(provide 'commandhelpers)
;;; commandhelpers.el ends here
