;; pencil-light.el

(require 'pencil)

(deftheme pencil)

(pencil-apply-theme
 'pencil
 nil)

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'pencil)
