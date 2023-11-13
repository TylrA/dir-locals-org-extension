((org-mode . ((eval . (setq original-directory default-directory))
	      (eval . (progn
			;; move up in the file system tree to find a directory containing .org.el
			(while (not (file-exists-p (format "%s.org.el" default-directory)))
			  (setq default-directory (file-name-directory (directory-file-name default-directory))))
			(load-file ".org.el")))
	      (eval . (setq default-directory original-directory)))))
