(add-to-list 'load-path (concat user-emacs-directory ".config"))
(require 'package)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t)
(require 'settings)  ;config settings
(require 'evilvim)   ;vim editor enablement and toggle
(require 'set-keys)  ;set control characters
(require 'commandhelpers) ;help-commands
(require 'set-python)
