;; commented out because it's handled in ~/.emacs.d/more-functions.el
;; (defun org-add-file-tag (tag)
;;   (let ((case-fold-search t)) ;; case-insensitive search
;;     (save-excursion
;;       (goto-char (point-min))
;;       (if (re-search-forward "^#\\+FILETAGS:" nil t)
;; 	  (unless (re-search-forward tag (line-end-position) t)
;; 	    (end-of-line)
;; 	    (insert (format " %s" tag)))
;; 	(goto-char (point-min))
;; 	(insert (format "#+FILETAGS: %s\n" tag))))))

;; (add-hook 'before-save-hook (lambda ()
;; 			      (if (derived-mode-p 'org-mode)
;; 				  (dolist (tag org-file-tags)
;; 				    (org-add-file-tag tag)))))

(setq dot-org-dot-el-template (format "%s.org.el.tmpl" default-directory))

(defun write-dot-org-dot-el-file (&optional dir)
  (interactive "D")
  (if (not (file-exists-p (format "%s.org.el" dir)))
      (progn (if (not (file-exists-p dir))
		 (make-directory dir t))
	     (copy-file dot-org-dot-el-template (format "%s.org.el" dir)))))
      
(write-dot-org-dot-el-file original-directory)

(setq org-use-tag-inheritance t)
