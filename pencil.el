;; Pencil (https://github.com/f1u77y/emacs-pencil-theme)

;;; pencil-theme.el

;;; Code:

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

(defcustom pencil/nebula nil
  "Enables a bluer background to go with the Ant-Nebula theme"
  :type 'boolean
  :group 'pencil)

(defcustom pencil/variable-family "sans-serif"
  "Alternate typeface to use for strings and documentation.
If nil, uses the same face as the default."
  :type 'string
  :group 'pencil)

(defun pencil-apply-theme (name dark?)
  (let ((black           (if pencil/nebula "#23262E" "#212121"))
        (medium-gray     "#767676")
        (white           "#f1f1f1")
        (actual-white    "#ffffff")
        (light-black     "#424242")
        (lighter-black   "#545454")

        (subtle-black    (cond (pencil/nebula "#282B33")
                               (pencil/higher-contrast-ui "#262626")
                               (t "#303030")))
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
        ((bg              (if dark? black         white        ))
         (bg-subtle       (if dark? light-black   light-gray   ))
         (bg-very-subtle  (if dark? subtle-black  lighter-gray ))
         (fg              (if dark? lighter-gray  light-black  ))
         (fg-subtle       (if dark? light-gray    lighter-black))
         (purple          (if dark? light-purple  dark-purple  ))
         (cyan            (if dark? light-cyan    dark-cyan    ))
         (green           (if dark? light-green   dark-green   ))
         (red             (if dark? light-red     dark-red     ))
         (bg-region       (if dark? lighter-black light-blue   ))
         (bg-highlight    (if dark? light-black   lighter-gray ))
         (comment         medium-gray))
      (let
          ((comment-face    `((t (:foreground ,comment :slant italic))))
           (constant-face   `((t (:foreground ,cyan  ))))
           (identifier-face `((t (:foreground ,dark-blue))))
           (statement-face  `((t (:foreground ,green))))
           (preproc-face    `((t (:foreground ,red))))
           (type-face       `((t (:foreground ,purple))))
           (special-face    `((t (:foreground ,pink))))
           (error-face      `((t (:foreground ,red :weight bold))))
           (text-face       `((t (:family ,pencil/variable-family :inherit font-lock-constant-face)))))

        (custom-theme-set-faces
         name

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
         `(linum-bg-very-subtle ((t (:foreground ,blue :background ,bg))))
         `(linum-highlight-face ((t (:foreground ,blue :background ,bg))))
         `(hl-line ((t (:background ,bg-very-subtle))))

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
         `(font-lock-doc-face                  ,text-face)
         `(font-lock-doc-string-face           ,text-face)
         `(font-lock-function-name-face        ,identifier-face)
         `(font-lock-keyword-face              ,statement-face)
         `(font-lock-negation-char-face        ,special-face)
         `(font-lock-preprocessor-face         ,preproc-face)
         `(font-lock-regexp-grouping-backslash ,constant-face)
         `(font-lock-regexp-grouping-construct ,constant-face)
         `(font-lock-string-face               ,text-face)
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
         ;; `(rainbow-delimiters-depth-1-face ((t (:foreground ,pink))))
         ;; `(rainbow-delimiters-depth-2-face ((t (:foreground ,blue))))
         ;; `(rainbow-delimiters-depth-3-face ((t (:foreground ,orange))))
         ;; `(rainbow-delimiters-depth-4-face ((t (:foreground ,purple))))
         ;; `(rainbow-delimiters-depth-5-face ((t (:foreground ,green))))
         ;; `(rainbow-delimiters-depth-6-face ((t (:foreground ,cyan))))
         ;; `(rainbow-delimiters-depth-7-face ((t (:foreground ,dark-red))))
         ;; `(rainbow-delimiters-depth-8-face ((t (:foreground ,dark-yellow))))
         ;; `(rainbow-delimiters-depth-9-face ((t (:foreground ,yellow))))
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
         `(org-agenda-structure ((t (:foreground ,blue :weight bold))))
         `(org-agenda-date ((t (:foreground ,fg :underline nil))))
         `(org-agenda-done ((t (:foreground ,green))))
         `(org-agenda-dimmed-todo-face ((t (:foreground ,comment))))
         `(org-block ((t (:foreground ,fg :background ,bg-very-subtle))))
         `(org-block-background ((t (:background ,bg-very-subtle))))
         `(org-block-begin-line ((t (:foreground ,bg :background ,bg))))
         `(org-code ((t (:foreground ,red :background ,bg))))
         `(org-verbatim ((t (:foreground ,dark-blue :inherit org-code))))
         `(org-column ((t (:background ,bg-very-subtle))))
         `(org-column-title ((t (:inherit org-column :weight bold :underline t))))
         `(org-date ((t (:foreground ,pink :underline t))))
         `(org-document-info ((t (:foreground ,fg-subtle :height 1.2))))
         `(org-document-info-keyword ((t (:foreground ,purple :height 1.2))))
         `(org-document-title ((t (:weight bold :foreground ,fg :height 1.2))))
         `(org-done ((t (:weight bold :foreground ,green))))
         `(org-ellipsis ((t (:foreground ,comment))))
         `(org-footnote ((t (:foreground ,blue))))
         `(org-formula ((t (:foreground ,red))))
         `(org-hide ((t (:foreground ,fg :background ,fg))))
         `(org-link ((t (:foreground ,red :underline t))))
         `(org-quote ((t (:foreground ,yellow :inherit org-block))))
         `(org-scheduled ((t (:foreground ,green))))
         `(org-scheduled-previously ((t (:foreground ,orange))))
         `(org-scheduled-today ((t (:foreground ,green))))
         `(org-special-keyword ((t (:foreground ,comment))))
         `(org-table ((t (:foreground ,dark-blue :background ,bg-very-subtle))))
         `(org-todo ((t (:weight bold :foreground ,red))))
         `(org-upcoming-deadline ((t (:foreground ,orange))))
         `(org-warning ((t (:weight bold :foreground ,red))))
         `(org-block-begin-line ((t (:foreground ,bg-subtle :background ,bg))))
         `(org-block-end-line ((t (:inherit org-block-begin-line))))
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

         ;; org-ref
         `(org-ref-acronym-face ((t (:foreground ,orange))))
         `(org-ref-label-face ((t (:foreground ,purple))))
         `(org-ref-cite-face ((t (:foreground ,green))))
         `(org-ref-ref-face ((t (:foreground ,red))))
         `(org-ref-glossary-face ((t (:foreground ,purple))))

         ;; diff
         `(diff-hl-insert ((t (:background ,green :foreground ,green))))
         `(diff-hl-change ((t (:background ,blue :foreground ,blue))))
         `(diff-hl-delete ((t (:background ,orange :foreground ,orange))))

         `(diff-added ((t (:foreground ,green))))
         `(diff-changed ((t (:foreground ,blue))))
         `(diff-removed ((t (:foreground ,orange))))
         `(diff-header ((t (:foreground ,blue :background nil))))
         `(diff-hunk-header ((t (:foreground ,purple))))
         `(diff-refine-added ((t (:inherit diff-added :inverse-video t))))
         `(diff-refine-removed ((t (:inherit diff-removed :inverse-video t))))

         `(ediff-even-diff-A ((t (:foreground nil :background nil :inverse-video t))))
         `(ediff-even-diff-B ((t (:foreground nil :background nil :inverse-video t))))
         `(ediff-odd-diff-A  ((t (:foreground ,comment :background nil :inverse-video t))))
         `(ediff-odd-diff-B  ((t (:foreground ,comment :background nil :inverse-video t))))

         ;; latex
         `(font-latex-sectioning-5-face ((t (:foreground ,yellow :weight normal))))
         `(font-latex-bold-face ((t (:foreground nil :inherit bold))))
         `(font-latex-italic-face ((t (:foreground nil :inherit italic))))
         `(font-latex-warning-face ((t (:foreground ,red :inherit bold))))
         `(font-latex-verbatim-face ((t (:foreground ,orange))))
         `(font-latex-math-face ((t (:inherit font-latex-verbatim-face))))

         ;; Magit
         `(magit-branch ((t (:foreground ,green))))
         `(magit-diff-added ((t (:inherit diff-added))))
         `(magit-diff-added-highlight ((t (:inherit magit-diff-added :background ,bg-very-subtle))))
         `(magit-diff-removed ((t (:inherit diff-removed))))
         `(magit-diff-removed-highlight ((t (:inherit magit-diff-removed :background ,bg-very-subtle))))
         `(magit-header ((t (:inherit nil :weight bold))))
         `(magit-item-highlight ((t (:inherit highlight :background nil))))
         `(magit-log-author ((t (:foreground ,blue))))
         `(magit-log-graph ((t (:foreground ,comment))))
         `(magit-log-date ((t (:foreground ,yellow))))
         `(magit-section-title ((t (:foreground ,blue :weight bold))))
         `(magit-section-highlight ((t (:background ,bg-very-subtle))))
         `(magit-section-heading ((t (:foreground ,yellow :weight bold))))
         `(magit-diff-file-heading ((t (:weight bold))))
         `(magit-diff-file-heading-highlight ((t (:background ,bg-very-subtle  :weight bold))))
         `(magit-diff-file-heading-selection ((t (:background ,bg :foreground ,orange :weight bold))))
         `(magit-diff-hunk-heading ((t (:background ,blue))))
         `(magit-diff-hunk-heading-highlight ((t (:background ,blue))))
         `(magit-diff-hunk-heading-selection ((t (:background ,bg :foreground ,orange))))
         `(magit-diff-lines-heading ((t (:background ,orange :foreground ,bg))))
         `(magit-blame-heading ((t (:background ,bg-very-subtle :foreground ,blue))))
         `(magit-blame-date ((t (:background ,bg-very-subtle :foreground ,blue))))
         `(magit-blame-summary ((t (:background ,bg-very-subtle :foreground ,green))))
         `(magit-diff-context-highlight ((t (:background ,bg-very-subtle :foreground ,fg-subtle))))
         `(magit-diff-context ((t (:foreground ,fg-subtle))))
         `(magit-diffstat-added ((t (:foreground ,green))))
         `(magit-diffstat-removed ((t (:foreground ,red))))
         `(magit-process-ok ((t (:foreground ,green  :weight bold))))
         `(magit-process-ng ((t (:foreground ,red    :weight bold))))
         `(magit-branch-local ((t (:foreground ,blue   :weight bold))))
         `(magit-branch-remote ((t (:foreground ,green  :weight bold))))
         `(magit-tag ((t (:foreground ,orange :weight bold))))
         `(magit-hash ((t (:foreground ,comment))))
         `(magit-sequence-stop ((t (:foreground ,green))))
         `(magit-sequence-part ((t (:foreground ,yellow))))
         `(magit-sequence-head ((t (:foreground ,blue))))
         `(magit-sequence-drop ((t (:foreground ,red))))

         ;; Helm
         `(helm-header ((t (:foreground ,fg :background ,bg))))
         `(helm-selection ((t (:background ,bg-very-subtle))))
         `(helm-match ((t (:foreground ,pink ))))
         `(helm-ff-file ((t (:foreground ,fg ))))
         `(helm-ff-directory ((t (:foreground ,blue ))))
         `(helm-ff-executable ((t (:foreground ,green ))))
         `(helm-buffer-directory ((t (:foreground ,blue))))
         `(helm-buffer-file ((t (:foreground ,fg))))
         `(helm-grep-file ((t (:foreground ,blue :underline t))))
         `(helm-buffer-process ((t (:foreground ,red))))
         `(helm-buffer-not-saved ((t (:foreground ,orange))))
         `(helm-candidate-number ((t (:foreground ,bg :background ,blue))))
         `(helm-source-header ((t (:background ,blue :foreground ,fg-subtle :height 1.3 :weight bold))))

         ;; ivy
         `(ivy-cursor ((t (:foreground ,fg :background ,bg))))
         `(ivy-current-match ((t (:foreground ,pink :background ,bg-very-subtle))))
         `(ivy-minibuffer-match-face-1 ((t (:foreground ,dark-blue :bg ,bg))))
         `(ivy-minibuffer-match-face-2 ((t (:foreground ,blue :weight bold))))
         `(ivy-minibuffer-match-face-3 ((t (:foreground ,red :weight bold))))
         `(ivy-minibuffer-match-face-4 ((t (:foreground ,cyan :weight bold))))
         `(ivy-confirm-face ((t (:foreground ,green :inherit minibuffer-prompt))))
         `(ivy-match-required-face ((t (:foreground ,pink :inherit minibuffer-prompt))))
         `(ivy-remove (tt (:foreground ,pink)))

         ;; guide-key
         `(guide-key/key-face ((t (:foreground ,fg))))
         `(guide-key/highlight-command-face ((t (:foreground ,orange))))
         `(guide-key/prefix-command-face ((t (:foreground ,dark-blue ))))

         ;; which-key
         `(which-key-key-face ((t (:foreground ,fg :weight bold))))
         `(which-key-special-key-face ((t (:foreground ,orange :weight bold :height 1.1))))
         `(which-key-command-description-face ((t (:foreground ,fg ))))
         `(which-key-group-description-face ((t (:foreground ,dark-blue ))))
         `(which-key-separator-face ((t (:foreground ,comment ))))

         )))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'pencil)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; pencil-theme.el ends here
