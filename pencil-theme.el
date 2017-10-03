;; Pencil (https://github.com/f1u77y/emacs-pencil-theme)

;;; pencil-theme.el

;;; Code:

(deftheme pencil)

(defgroup pencil nil
  "Pencil color theme group")

(defcustom pencil/higher-contrast-ui nil
  "Higher contrast of various background colors"
  :type 'boolean
  :group 'pencil)

(defcustom pencil/italics t
  "Enables italics"
  :type 'boolean
  :group 'pencil)

(defcustom pencil/dark nil
  "Use dark variant"
  :type 'boolean
  :group 'pencil)

(let ((black           "#212121")
      (medium-gray     "#767676")
      (white           "#f1f1f1")
      (actual-white    "#ffffff")
      (light-black     "#424242")
      (lighter-black   "#545454")

      (subtle-black    (if pencil/higher-contrast-ui "#262626" "#303030"))
      (light-gray      (if pencil/higher-contrast-ui "#d9d9d9" "#b2b2b2"))
      (lighter-gray    (if pencil/higher-contrast-ui "#e5e6e6" "#c6c6c6"))

      (pink            "#fb007a")
      (dark-red        "#c30071")
      (light-red       "#e32791")
      (orange          "#d75f5f")

      (darker-blue     "#005f87")
      (dark-blue       "#008ec4")
      (blue            "#20bbfc")
      (light-blue      "#b6d6fd")
      (dark-cyan       "#20a5ba")
      (light-cyan      "#4fb8cc")

      (dark-green      "#10a778")
      (light-green     "#5fd7a7")

      (dark-purple     "#523c79")
      (light-purple    "#6855de")

      (yellow          "#f3e430")
      (dark-yellow     "#a89c14"))

  (let
      ((bg              (if pencil/dark black         white        ))
       (bg-subtle       (if pencil/dark light-black   light-gray   ))
       (bg-very-subtle  (if pencil/dark subtle-black  lighter-gray ))
       (fg              (if pencil/dark lighter-gray  light-black  ))
       (fg-subtle       (if pencil/dark light-gray    lighter-black))
       (purple          (if pencil/dark light-purple  dark-purple  ))
       (cyan            (if pencil/dark light-cyan    dark-cyan    ))
       (green           (if pencil/dark light-green   dark-green   ))
       (red             (if pencil/dark light-red     dark-red     ))
       (bg-region       (if pencil/dark lighter-black light-blue   ))
       (bg-highlight    (if pencil/dark light-black   lighter-gray ))
       (comment         medium-gray))
    (let
        ((comment-face    `((t (:foreground ,comment :slant italic))))
         (constant-face   `((t (:foreground ,cyan  ))))
         (identifier-face `((t (:foreground ,dark-blue))))
         (statement-face  `((t (:foreground ,green))))
         (preproc-face    `((t (:foreground ,red))))
         (type-face       `((t (:foreground ,purple))))
         (special-face    `((t (:foreground ,pink))))
         (error-face      `((t (:foreground ,red :weight bold)))))

      (custom-theme-set-faces
       'pencil

       ;; Default
       `(default ((t (:background ,bg :foreground ,fg))))
       `(bold ((t (:weight bold))))
       `(bold-italic ((t (:slant italic :weight bold))))
       `(underline ((t (:underline t))))
       `(italic ((t (:slant italic))))
       `(cursor ((t (:background ,blue :foreground ,fg))))
       `(border ((t (:background ,bg-very-subtle))))
       `(fringe ((t (:background ,bg))))
       `(highlight ((t (:background ,bg-highlight))))
       `(link ((t (:foreground ,cyan))))
       `(link-visited ((t (:foreground ,purple))))
       `(minibuffer-prompt ((t (:foreground ,green :weight normal))))

       ;; which-function
       `(which-func ((t (:foreground ,blue :background nil))))

       ;; linum-mode
       `(linum ((t (:foreground ,bg-subtle :background ,bg))))
       `(linum-current-line ((t (:foreground ,blue :background ,bg))))
       `(linum-highlight-face ((t (:foreground ,blue :background ,bg))))

       ;; Mode line
       `(mode-line ((t (:background ,bg-subtle :box nil))))
       `(mode-line-buffer-id ((t (:foreground ,fg))))
       `(mode-line-emphasis ((t (:foreground ,fg :slant italic))))
       `(mode-line-highlight ((t (:foreground ,fg :background ,green :box nil))))
       `(mode-line-inactive ((t (:foreground ,bg-very-subtle :box nil))))


       `(region ((t (:background ,bg-region))))
       `(secondary-selection ((t (:background ,bg-region))))
       `(error ((t (:foreground ,red :weight bold))))
       `(warning ((t (:foreground ,light-red :weight bold))))
       `(success ((t (:foreground ,green :weight bold))))
       `(shadow ((t (:foreground ,comment))))

       `(header-line ((t (:inherit mode-line :background nil))))

       ;; Font-lock stuff
       `(font-lock-builtin-face              ,constant-face)
       `(font-lock-comment-delimiter-face    ,comment-face)
       `(font-lock-comment-face              ,comment-face)
       `(font-lock-constant-face             ,constant-face)
       `(font-lock-doc-face                  ,constant-face)
       `(font-lock-doc-string-face           ,constant-face)
       `(font-lock-function-name-face        ,identifier-face)
       `(font-lock-keyword-face              ,statement-face)
       `(font-lock-negation-char-face        ,special-face)
       `(font-lock-preprocessor-face         ,preproc-face)
       `(font-lock-regexp-grouping-backslash ,constant-face)
       `(font-lock-regexp-grouping-construct ,constant-face)
       `(font-lock-string-face               ,constant-face)
       `(font-lock-type-face                 ,type-face)
       `(font-lock-variable-name-face        ,identifier-face)
       `(font-lock-warning-face              ,error-face)
       `(highlight-numbers-number            ,constant-face)


       ;; Search
       `(match ((t (:background ,bg-very-subtle : :inverse-video t))))
       `(isearch ((t (:foreground ,yellow :background ,light-black :inverse-video t))))
       `(isearch-lazy-highlight-face ((t (:background ,bg-subtle :inverse-video t))))
       `(isearch-fail ((t (:color ,light-red :inverse-video t))))

       ;; Popups
       `(popup-face ((t (:foreground ,fg-subtle :background ,bg-very-subtle))))
       `(popup-isearch-match ((t (:foreground ,fg-subtle :background ,yellow))))
       `(popup-scroll-bar-background-face ((t (:background ,fg-subtle))))
       `(popup-scroll-bar-foreground-face ((t (:background ,bg-subtle))))
                                        ;       `(popup-summary-face ((t (:foreground ,base03))))
       `(popup-tip-face ((t (:foreground ,fg-subtle :background ,bg-very-subtle))))
       `(popup-menu-mouse-face ((t (:foreground ,fg-subtle :background ,bg-region))))
       `(popup-menu-selection-face ((t (:foreground ,fg-subtle :background ,bg-region))))

       ;; Company
       ;; `(company-echo ((t ())))
       ;; `(company-echo-common ((t ())))
       `(company-preview ((t (:foreground ,comment :background ,bg-subtle))))
       `(company-preview-common ((t (:foreground ,comment :background ,bg-subtle)))) ; same background as highlight-line
       ;; `(company-preview-search ((t ())))
       `(company-scrollbar-bg ((t (:background ,white))))
       `(company-scrollbar-fg ((t (:background ,bg-subtle))))
       `(company-template-field ((t (:background ,bg-subtle))))
       `(company-tooltip ((t (:weight normal :foreground ,fg :background ,bg-subtle))))
       `(company-tooltip-annotation ((t (:weight normal :foreground ,comment :background ,bg-subtle))))
       `(company-tooltip-annotation-selection ((t (:weight normal :inherit company-tooltip-selection))))
       `(company-tooltip-common ((t (:weight normal :inherit company-tooltip))))
       `(company-tooltip-common-selection ((t (:weight normal :inherit company-tooltip-selection))))
       ;; `(company-tooltip-mouse ((t ())))
       ;; `(company-tooltip-search ((t ())))
       `(company-tooltip-selection ((t (:weight normal :foreground ,fg :background ,blue))))

       ;; Flycheck
       `(flycheck-error ((t (:underline (:style wave :color ,red)))))
       `(flycheck-info ((t (:underline (:style wave :color ,blue)))))
       `(flycheck-warning ((t (:underline (:style wave :color ,orange)))))
       `(flycheck-fringe-error ((t (:foreground ,red :background ,bg-very-subtle))))
       `(flycheck-fringe-info ((t (:foreground ,blue :background ,bg-very-subtle))))
       `(flycheck-fringe-warning ((t (:foreground ,yellow :background ,bg-very-subtle))))
       ;; Flymake
       `(flymake-warnline ((t (:underline (:style wave :color ,orange) :background ,bg))))
       `(flymake-errline ((t (:underline (:style wave :color ,red) :background ,bg))))

       ;; Powerline
       `(powerline-active1 ((t (:foreground ,fg :background ,bg-subtle))))
       `(powerline-active2 ((t (:foreground ,fg :background ,medium-gray))))
       `(powerline-inactive1 ((t (:foreground ,medium-gray :background ,bg-subtle))))
       `(powerline-inactive2 ((t (:foreground ,medium-gray :background ,bg-subtle))))

       ;; Spaceline
       `(spaceline-python-venv ((t (:foreground ,comment))))
       `(spaceline-evil-normal ((t (:foreground ,fg :background ,lighter-black :inherit mode-line))))
       `(spaceline-evil-insert ((t (:foreground ,bg :background ,darker-blue :inherit mode-line))))
       `(spaceline-evil-visual ((t (:foreground ,fg :background ,pink :inherit mode-line))))
       `(spaceline-evil-replace ((t (:foreground ,fg :background ,dark-red :inherit mode-line))))

       ;; Spacemacs
       `(spacemacs-normal-face ((t (:inherit spaceline-evil-normal))))
       `(spacemacs-insert-face ((t (:inherit spaceline-evil-insert))))
       `(spacemacs-visual-face ((t (:inherit spaceline-evil-visual))))
       `(spacemacs-replace-face ((t (:inherit spaceline-evil-visual))))

       ;; Rainbow-delimiters
       ;`(rainbow-delimiters-depth-1-face ((t (:foreground ,pink))))
       ;`(rainbow-delimiters-depth-2-face ((t (:foreground ,blue))))
       ;`(rainbow-delimiters-depth-3-face ((t (:foreground ,orange))))
       ;`(rainbow-delimiters-depth-4-face ((t (:foreground ,purple))))
       ;`(rainbow-delimiters-depth-5-face ((t (:foreground ,green))))
       ;`(rainbow-delimiters-depth-6-face ((t (:foreground ,cyan))))
       ;`(rainbow-delimiters-depth-7-face ((t (:foreground ,dark-red))))
       ;`(rainbow-delimiters-depth-8-face ((t (:foreground ,dark-yellow))))
       ;`(rainbow-delimiters-depth-9-face ((t (:foreground ,yellow))))
       `(rainbow-delimiters-depth-1-face ((t (:foreground ,dark-red))))
       `(rainbow-delimiters-depth-2-face ((t (:foreground ,pink))))
       `(rainbow-delimiters-depth-3-face ((t (:foreground ,pink))))
       `(rainbow-delimiters-depth-4-face ((t (:foreground ,pink))))
       `(rainbow-delimiters-depth-5-face ((t (:foreground ,pink))))
       `(rainbow-delimiters-depth-6-face ((t (:foreground ,pink))))
       `(rainbow-delimiters-depth-7-face ((t (:foreground ,pink))))
       `(rainbow-delimiters-depth-8-face ((t (:foreground ,pink))))
       `(rainbow-delimiters-depth-9-face ((t (:foreground ,pink))))
       `(rainbow-delimiters-unmatched-face ((t (:foreground ,fg :background ,orange))))

       ;; rust-mode
       `(rust-question-mark-face ((t (:foreground ,pink :inherit font-lock-builtin-face))))

       ;; org-mode
       `(org-agenda-structure ((t (:foreground ,blue :bold t))))
       `(org-agenda-date ((t (:foreground ,fg :underline nil))))
       `(org-agenda-done ((t (:foreground ,green))))
       `(org-agenda-dimmed-todo-face ((t (:foreground ,comment))))
       `(org-block ((t (:foreground ,fg :background ,bg-very-subtle))))
       `(org-block-background ((,t (:background ,bg-very-subtle))))
       `(org-code ((t (:foreground ,red :background ,bg))))
       `(org-verbatim ((t (:foreground ,dark-blue :inherit org-code))))
       ;`(org-column ((t (:background ,current-line))))
       ;`(org-column-title ((t (:inherit org-column :weight bold :underline t))))
       `(org-date ((t (:foreground ,pink :underline t))))
       `(org-document-info ((t (:foreground ,fg-subtle :height 1.2))))
       `(org-document-info-keyword ((t (:foreground ,purple :height 1.2))))
       `(org-document-title ((t (:weight bold :foreground ,fg :height 1.2))))
       `(org-done ((t (:bold t :foreground ,green))))
       `(org-ellipsis ((t (:foreground ,comment))))
       `(org-footnote ((t (:foreground ,blue))))
       `(org-formula ((t (:foreground ,red))))
       `(org-hide ((t (:foreground ,fg :background ,fg))))
       `(org-link ((t (:foreground ,red :underline t))))
       `(org-scheduled ((t (:foreground ,green))))
       `(org-scheduled-previously ((t (:foreground ,orange))))
       `(org-scheduled-today ((t (:foreground ,green))))
       `(org-special-keyword ((t (:foreground ,comment))))
       `(org-table ((t (:foreground ,dark-blue :background ,bg-very-subtle))))
       `(org-todo ((t (:bold t :foreground ,red))))
       `(org-upcoming-deadline ((t (:foreground ,orange))))
       `(org-warning ((t (:weight bold :foreground ,red))))
       `(org-block-begin-line ((t (:foreground ,bg-subtle :background ,bg))))
       `(org-block-end-line ((t (:foreground ,bg-subtle :background ,bg))))
       `(org-kbd ((t (:background ,comment :foreground ,fg
                                       :box (:line-width 1 :color nil :style pressed-button)))))

       `(org-level-1 ((t (:inherit outline-1 :foreground ,blue))))
       `(org-level-2 ((t (:inherit outline-2 :foreground ,cyan))))
       `(org-level-3 ((t (:inherit outline-3 :foreground ,dark-blue))))
       `(org-level-4 ((t (:inherit outline-4 :foreground ,green))))
       `(org-level-5 ((t (:inherit outline-5 :foreground ,red))))
       `(org-level-6 ((t (:inherit outline-6 :foreground ,purple))))
       `(org-level-7 ((t (:inherit outline-7 :foreground ,pink))))
       `(org-level-8 ((t (:inherit outline-8))))
       `(org-level-9 ((t (:inherit outline-9))))

       ))))
(provide-theme 'pencil)

;;; pencil-theme.el ends here
