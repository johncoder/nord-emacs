;;; nord-theme.el --- An arctic, north-bluish clean and elegant theme

;; Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com> (https://www.arcticicestudio.com)
;; Copyright (C) 2016-present Sven Greb <development@svengreb.de> (https://www.svengreb.de)

;; Title: Nord Theme
;; Project: nord-emacs
;; Version: 0.5.0
;; URL: https://github.com/arcticicestudio/nord-emacs
;; Author: Arctic Ice Studio <development@arcticicestudio.com>
;; Package-Requires: ((emacs "24"))
;; License: MIT

;;; Commentary:

;; Nord is a 16 colorspace theme build to run in GUI- and terminal
;; mode with support for many third-party syntax- and UI packages.

;;; References:
;; Awesome Emacs
;;   https://github.com/emacs-tw/awesome-emacs
;; GNU ELPA
;;   https://elpa.gnu.org
;; GNU Emacs
;;   https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;;   https://www.gnu.org/software/emacs/manual/html_node/emacs/Creating-Custom-Themes.html
;;   https://www.gnu.org/software/emacs/manual/html_node/emacs/Faces.html
;;   https://www.gnu.org/software/emacs/manual/html_node/emacs/Standard-Faces.html
;;   https://www.gnu.org/software/emacs/manual/html_node/emacs/Face-Customization.html
;;   https://www.gnu.org/software/emacs/manual/html_node/elisp/Face-Attributes.html
;;   https://www.gnu.org/software/emacs/manual/html_node/elisp/Faces-for-Font-Lock.html
;;   https://www.gnu.org/software/emacs/manual/html_node/elisp/Display-Feature-Testing.html
;; marmalade repo
;;   https://marmalade-repo.org
;; MELPA
;;   https://melpa.org
;;   https://stable.melpa.org

;;; Code:

(unless (>= emacs-major-version 24)
  (error "Nord theme requires Emacs 24 or later!"))

(deftheme nord-light "An arctic, north-bluish clean and elegant theme")

(defgroup nord-light nil
  "Nord-Light theme customizations.
  The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom nord-light-comment-brightness 10
  "Allows to define a custom comment color brightness with percentage adjustments from 0% - 20%.
  As of version 0.4.0, this variable is obsolete/deprecated and has no effect anymore and will be removed in version 1.0.0!
  The comment color brightness has been increased by 10% by default.
  Please see https://github.com/arcticicestudio/nord-light-emacs/issues/73 for more details."
  :type 'integer
  :group 'nord-light)

(make-obsolete-variable
  'nord-light-comment-brightness
  "The custom color brightness feature has been deprecated and will be removed in version 1.0.0!
  The comment color brightness has been increased by 10% by default.
  Please see https://github.com/arcticicestudio/nord-light-emacs/issues/73 for more details."
  "0.4.0")

(defcustom nord-light-region-highlight nil
  "Allows to set a region highlight style based on the Nord-Light components.
  Valid styles are
    - 'snowstorm' - Uses 'nord-light0' as foreground- and 'nord-light4' as background color
    - 'frost' - Uses 'nord-light0' as foreground- and 'nord-light8' as background color"
  :type 'string
  :group 'nord-light)

(defcustom nord-light-uniform-mode-lines nil
  "Enables uniform activate- and inactive mode lines using 'nord-light3' as background."
  :type 'boolean
  :group 'nord-light)

(setq nord-light-theme--brightened-comments '("#4c566a" "#4e586d" "#505b70" "#525d73" "#556076" "#576279" "#59647c" "#5b677f" "#5d6982" "#5f6c85" "#616e88" "#63718b" "#66738e" "#687591" "#6a7894" "#6d7a96" "#6f7d98" "#72809a" "#75829c" "#78859e" "#7b88a1"))

(defun nord-light-theme--brightened-comment-color (percent)
  "Returns the brightened comment color for the given percent.
  The value must be greater or equal to 0 and less or equal to 20, otherwise the default 'nord-light3' color is used.
  As of version 0.4.0, this function is obsolete/deprecated and has no effect anymore and will be removed in version 1.0.0!
  The comment color brightness has been increased by 10% by default.
  Please see https://github.com/arcticicestudio/nord-light-emacs/issues/73 for more details."
  (nth 10 nord-light-theme--brightened-comments))

(make-obsolete
  'nord-light-theme--brightened-comment-color
  "The custom color brightness feature has been deprecated and will be removed in version 1.0.0!\
  The comment color brightness has been increased by 10% by default.\
  Please see https://github.com/arcticicestudio/nord-light-emacs/issues/73 for more details."
  "0.4.0")

(defun nord-light-display-truecolor-or-graphic-p ()
  "Returns whether the display can display nord-light colors"
  (or (= (display-color-cells) 16777216) (display-graphic-p)))

;;;; Color Constants
(let ((class '((class color) (min-colors 89)))
  (nord-light0 (if (nord-light-display-truecolor-or-graphic-p) "#2E3440" nil))
  (nord-light1 (if (nord-light-display-truecolor-or-graphic-p) "#3B4252" "black"))
  (nord-light2 (if (nord-light-display-truecolor-or-graphic-p) "#434C5E" "#434C5E"))
  (nord-light3 (if (nord-light-display-truecolor-or-graphic-p) "#4C566A" "brightblack"))
  (nord-light4 (if (nord-light-display-truecolor-or-graphic-p) "#D8DEE9" "#D8DEE9"))
  (nord-light5 (if (nord-light-display-truecolor-or-graphic-p) "#E5E9F0" "white"))
  (nord-light6 (if (nord-light-display-truecolor-or-graphic-p) "#ECEFF4" "brightwhite"))
  (nord-light7 (if (nord-light-display-truecolor-or-graphic-p) "#8FBCBB" "cyan"))
  (nord-light8 (if (nord-light-display-truecolor-or-graphic-p) "#88C0D0" "brightcyan"))
  (nord-light9 (if (nord-light-display-truecolor-or-graphic-p) "#81A1C1" "blue"))
  (nord-light10 (if (nord-light-display-truecolor-or-graphic-p) "#5E81AC" "brightblue"))
  (nord-light11 (if (nord-light-display-truecolor-or-graphic-p) "#BF616A" "red"))
  (nord-light12 (if (nord-light-display-truecolor-or-graphic-p) "#D08770" "brightyellow"))
  (nord-light13 (if (nord-light-display-truecolor-or-graphic-p) "#EBCB8B" "yellow"))
  (nord-light14 (if (nord-light-display-truecolor-or-graphic-p) "#A3BE8C" "green"))
  (nord-light15 (if (nord-light-display-truecolor-or-graphic-p) "#B48EAD" "magenta"))
  (nord-light-annotation (if (nord-light-display-truecolor-or-graphic-p) "#D08770" "brightyellow"))
  (nord-light-attribute (if (nord-light-display-truecolor-or-graphic-p) "#8FBCBB" "cyan"))
  (nord-light-class (if (nord-light-display-truecolor-or-graphic-p) "#8FBCBB" "cyan"))
  (nord-light-comment (if (nord-light-display-truecolor-or-graphic-p) "#7C869A" "brightblack"))
  (nord-light-escape (if (nord-light-display-truecolor-or-graphic-p) "#D08770" "brightyellow"))
  (nord-light-method (if (nord-light-display-truecolor-or-graphic-p) "#5E81AC" "brightcyan"))
  (nord-light-keyword (if (nord-light-display-truecolor-or-graphic-p) "#81A1C1" "blue"))
  (nord-light-numeric (if (nord-light-display-truecolor-or-graphic-p) "#B48EAD" "magenta"))
  (nord-light-operator (if (nord-light-display-truecolor-or-graphic-p) "#81A1C1" "blue"))
  (nord-light-preprocessor (if (nord-light-display-truecolor-or-graphic-p) "#D08770" "brightblue"))
  (nord-light-punctuation (if (nord-light-display-truecolor-or-graphic-p) "#4C566A" "#4C566A"))
  (nord-light-regexp (if (nord-light-display-truecolor-or-graphic-p) "#EBCB8B" "yellow"))
  (nord-light-string (if (nord-light-display-truecolor-or-graphic-p) "#A3BE8C" "green"))
  (nord-light-tag (if (nord-light-display-truecolor-or-graphic-p) "#81A1C1" "blue"))
  (nord-light-variable (if (nord-light-display-truecolor-or-graphic-p) "#5E81AC" "#5E81AC"))
  (nord-light-region-highlight-foreground (if (or
    (string= nord-light-region-highlight "frost")
    (string= nord-light-region-highlight "snowstorm")) "#2E3440" nil))
  (nord-light-region-highlight-background (if
    (string= nord-light-region-highlight "frost") "#88C0D0"
      (if (string= nord-light-region-highlight "snowstorm") "#D8DEE9" "#434C5E")))
  (nord-light-uniform-mode-lines-background (if nord-light-uniform-mode-lines "#4C566A" "#3B4252")))

;;;; +------------+
;;;; + Core Faces +
;;;; +------------+
  (custom-theme-set-faces
    'nord-light
    ;; +--- Base ---+
    `(bold ((,class (:weight bold))))
    `(bold-italic ((,class (:weight bold :slant italic))))
    `(default ((,class (:foreground ,nord-light3 :background "#FFFFFF"))))
    `(error ((,class (:foreground ,nord-light11 :weight bold))))
    `(escape-glyph ((,class (:foreground ,nord-light12))))
    `(font-lock-builtin-face ((,class (:foreground ,nord-light9))))
    `(font-lock-comment-face ((,class (:foreground ,nord-light-comment))))
    `(font-lock-comment-delimiter-face ((,class (:foreground ,nord-light-comment))))
    `(font-lock-constant-face ((,class (:foreground ,nord-light9))))
    `(font-lock-doc-face ((,class (:foreground ,nord-light-comment))))
    `(font-lock-function-name-face ((,class (:foreground ,nord-light15))))
    `(font-lock-keyword-face ((,class (:foreground ,nord-light9))))
    `(font-lock-negation-char-face ((,class (:foreground ,nord-light9))))
    `(font-lock-preprocessor-face ((,class (:foreground ,nord-light10 :weight bold))))
    `(font-lock-reference-face ((,class (:foreground ,nord-light9))))
    `(font-lock-regexp-grouping-backslash ((,class (:foreground ,nord-light13))))
    `(font-lock-regexp-grouping-construct ((,class (:foreground ,nord-light13))))
    `(font-lock-string-face ((,class (:foreground ,nord-light14))))
    `(font-lock-type-face ((,class (:foreground ,nord-light7))))
    `(font-lock-variable-name-face ((,class (:foreground ,nord-light15))))
    `(font-lock-warning-face ((,class (:foreground ,nord-light13))))
    `(italic ((,class (:slant italic))))
    `(shadow ((,class (:foreground ,nord-light3))))
    `(underline ((,class (:underline t))))
    `(warning ((,class (:foreground ,nord-light13 :weight bold))))

    ;; +--- Syntax ---+
    ;; > C
    `(c-annotation-face ((,class (:foreground ,nord-light-annotation))))

    ;; > diff
    `(diff-added ((,class (:foreground ,nord-light14))))
    `(diff-changed ((,class (:foreground ,nord-light13))))
    `(diff-context ((,class (:inherit default))))
    `(diff-file-header ((,class (:foreground ,nord-light8))))
    `(diff-function ((,class (:foreground ,nord-light7))))
    `(diff-header ((,class (:foreground ,nord-light9 :weight bold))))
    `(diff-hunk-header ((,class (:foreground ,nord-light9 :background "#FFFFFF"))))
    `(diff-indicator-added ((,class (:foreground ,nord-light14))))
    `(diff-indicator-changed ((,class (:foreground ,nord-light13))))
    `(diff-indicator-removed ((,class (:foreground ,nord-light11))))
    `(diff-nonexistent ((,class (:foreground ,nord-light11))))
    `(diff-refine-added ((,class (:foreground ,nord-light14))))
    `(diff-refine-changed ((,class (:foreground ,nord-light13))))
    `(diff-refine-removed ((,class (:foreground ,nord-light11))))
    `(diff-removed ((,class (:foreground ,nord-light11))))

    ;; +--- UI ---+
    `(border ((,class (:foreground ,nord-light4))))
    `(buffer-menu-buffer ((,class (:foreground ,nord-light4 :weight bold))))
    `(button ((,class (:background "#FFFFFF" :foreground ,nord-light8 :box (:line-width 2 :color ,nord-light4 :style sunken-button)))))
    `(completions-annotations ((,class (:foreground ,nord-light9))))
    `(completions-common-part ((,class (:foreground ,nord-light8 :weight bold))))
    `(completions-first-difference ((,class (:foreground ,nord-light11))))
    `(custom-button ((,class (:background "#FFFFFF" :foreground ,nord-light8 :box (:line-width 2 :color ,nord-light4 :style sunken-button)))))
    `(custom-button-mouse ((,class (:background ,nord-light4 :foreground ,nord-light0 :box (:line-width 2 :color ,nord-light4 :style sunken-button)))))
    `(custom-button-pressed ((,class (:background ,nord-light6 :foreground ,nord-light0 :box (:line-width 2 :color ,nord-light4 :style sunken-button)))))
    `(custom-button-pressed-unraised ((,class (:background ,nord-light4 :foreground ,nord-light0 :box (:line-width 2 :color ,nord-light4 :style sunken-button)))))
    `(custom-button-unraised ((,class (:background "#FFFFFF" :foreground ,nord-light8 :box (:line-width 2 :color ,nord-light4 :style sunken-button)))))
    `(custom-changed ((,class (:foreground ,nord-light13))))
    `(custom-comment ((,class (:foreground ,nord-light-comment))))
    `(custom-comment-tag ((,class (:foreground ,nord-light7))))
    `(custom-documentation ((,class (:foreground ,nord-light4))))
    `(custom-group-tag ((,class (:foreground ,nord-light8 :weight bold))))
    `(custom-group-tag-1 ((,class (:foreground ,nord-light8 :weight bold))))
    `(custom-invalid ((,class (:foreground ,nord-light11))))
    `(custom-modified ((,class (:foreground ,nord-light13))))
    `(custom-rogue ((,class (:foreground ,nord-light12 :background ,nord-light4))))
    `(custom-saved ((,class (:foreground ,nord-light14))))
    `(custom-set ((,class (:foreground ,nord-light8))))
    `(custom-state ((,class (:foreground ,nord-light14))))
    `(custom-themed ((,class (:foreground ,nord-light8 :background ,nord-light4))))
    `(cursor ((,class (:background ,nord-light0))))
    `(fringe ((,class (:foreground ,nord-light4 :background "#FFFFFF"))))
    `(file-name-shadow ((,class (:inherit shadow))))
    `(header-line ((,class (:foreground ,nord-light15 :background ,nord-light4))))
    `(help-argument-name ((,class (:foreground ,nord-light8))))
    `(highlight ((,class (:foreground ,nord-light8 :background ,nord-light5))))
    `(hl-line ((,class (:background ,nord-light5))))
    `(info-menu-star ((,class (:foreground ,nord-light9))))
    `(isearch ((,class (:foreground ,nord-light0 :background ,nord-light8))))
    `(isearch-fail ((,class (:foreground ,nord-light11))))
    `(link ((,class (:underline t))))
    `(link-visited ((,class (:underline t))))
    `(linum ((,class (:foreground ,nord-light3 :background "#FFFFFF"))))
    `(linum-relative-current-face ((,class (:foreground ,nord-light3 :background "#FFFFFF"))))
    `(match ((,class (:inherit isearch))))
    `(message-cited-text ((,class (:foreground ,nord-light4))))
    `(message-header-cc ((,class (:foreground ,nord-light9))))
    `(message-header-name ((,class (:foreground ,nord-light7))))
    `(message-header-newsgroup ((,class (:foreground ,nord-light14))))
    `(message-header-other ((,class (:foreground ,nord-light4))))
    `(message-header-subject ((,class (:foreground ,nord-light8))))
    `(message-header-to ((,class (:foreground ,nord-light9))))
    `(message-header-xheader ((,class (:foreground ,nord-light13))))
    `(message-mml ((,class (:foreground ,nord-light10))))
    `(message-separator ((,class (:inherit shadow))))
    `(minibuffer-prompt ((,class (:foreground ,nord-light8 :weight bold))))
    `(mm-command-output ((,class (:foreground ,nord-light8))))
    `(mode-line ((,class (:foreground ,nord-light6 :background ,nord-light10))))
    `(mode-line-buffer-id ((,class (:weight bold))))
    `(mode-line-highlight ((,class (:inherit highlight))))
    `(mode-line-inactive ((,class (:foreground ,nord-light3 :background ,nord-light4))))
    `(next-error ((,class (:inherit error))))
    `(nobreak-space ((,class (:foreground ,nord-light3))))
    `(outline-1 ((,class (:foreground ,nord-light8 :weight bold))))
    `(outline-2 ((,class (:inherit outline-1))))
    `(outline-3 ((,class (:inherit outline-1))))
    `(outline-4 ((,class (:inherit outline-1))))
    `(outline-5 ((,class (:inherit outline-1))))
    `(outline-6 ((,class (:inherit outline-1))))
    `(outline-7 ((,class (:inherit outline-1))))
    `(outline-8 ((,class (:inherit outline-1))))
    `(package-description ((,class (:foreground ,nord-light4))))
    `(package-help-section-name ((,class (:foreground ,nord-light8 :weight bold))))
    `(package-name ((,class (:foreground ,nord-light8))))
    `(package-status-available ((,class (:foreground ,nord-light7))))
    `(package-status-avail-obso ((,class (:foreground ,nord-light7 :slant italic))))
    `(package-status-built-in ((,class (:foreground ,nord-light9))))
    `(package-status-dependency ((,class (:foreground ,nord-light8 :slant italic))))
    `(package-status-disabled ((,class (:foreground ,nord-light3))))
    `(package-status-external ((,class (:foreground ,nord-light12 :slant italic))))
    `(package-status-held ((,class (:foreground ,nord-light4 :weight bold))))
    `(package-status-new ((,class (:foreground ,nord-light14))))
    `(package-status-incompat ((,class (:foreground ,nord-light11))))
    `(package-status-installed ((,class (:foreground ,nord-light7 :weight bold))))
    `(package-status-unsigned ((,class (:underline ,nord-light13))))
    `(query-replace ((,class (:foreground ,nord-light8 :background ,nord-light4))))
    `(region ((,class (:foreground ,nord-light4 :background ,nord-light15))))
    `(scroll-bar ((,class (:background ,nord-light3))))
    `(secondary-selection ((,class (:background ,nord-light4))))

    ;; `show-paren-match-face` and `show-paren-mismatch-face` are deprecated since Emacs version 22.1 and were
    ;; removed in Emacs 25.
    ;; https://github.com/arcticicestudio/nord-light-emacs/issues/75
    ;; http://git.savannah.gnu.org/cgit/emacs.git/commit/?id=c430f7e23fc2c22f251ace4254e37dea1452dfc3
    ;; https://github.com/emacs-mirror/emacs/commit/c430f7e23fc2c22f251ace4254e37dea1452dfc3
    `(show-paren-match-face ((,class (:foreground ,nord-light0 :background ,nord-light8))))
    `(show-paren-mismatch-face ((,class (:background ,nord-light11))))

    `(show-paren-match ((,class (:foreground ,nord-light0 :background ,nord-light8))))
    `(show-paren-mismatch ((,class (:background ,nord-light11))))
    `(success ((,class (:foreground ,nord-light14))))
    `(term ((,class (:foreground ,nord-light4 :background "#FFFFFF"))))
    `(term-color-black ((,class (:foreground ,nord-light1 :background ,nord-light4))))
    `(term-color-white ((,class (:foreground ,nord-light5 :background ,nord-light5))))
    `(term-color-cyan ((,class (:foreground ,nord-light7 :background ,nord-light7))))
    `(term-color-blue ((,class (:foreground ,nord-light8 :background ,nord-light8))))
    `(term-color-red ((,class (:foreground ,nord-light11 :background ,nord-light11))))
    `(term-color-yellow ((,class (:foreground ,nord-light13 :background ,nord-light13))))
    `(term-color-green ((,class (:foreground ,nord-light14 :background ,nord-light14))))
    `(term-color-magenta ((,class (:foreground ,nord-light15 :background ,nord-light15))))
    `(tool-bar ((,class (:foreground ,nord-light4 :background ,nord-light3))))
    `(tooltip ((,class (:foreground ,nord-light0 :background ,nord-light4))))
    `(trailing-whitespace ((,class (:foreground ,nord-light3))))
    `(tty-menu-disabled-face ((,class (:foreground ,nord-light1))))
    `(tty-menu-enabled-face ((,class (:background ,nord-light4 foreground ,nord-light4))))
    `(tty-menu-selected-face ((,class (:foreground ,nord-light8 :underline t))))
    `(undo-tree-visualizer-current-face ((,class (:foreground ,nord-light8))))
    `(undo-tree-visualizer-default-face ((,class (:foreground ,nord-light4))))
    `(undo-tree-visualizer-unmodified-face ((,class (:foreground ,nord-light4))))
    `(undo-tree-visualizer-register-face ((,class (:foreground ,nord-light9))))
    `(vc-conflict-state ((,class (:foreground ,nord-light12))))
    `(vc-edited-state ((,class (:foreground ,nord-light13))))
    `(vc-locally-added-state ((,class (:underline ,nord-light14))))
    `(vc-locked-state ((,class (:foreground ,nord-light10))))
    `(vc-missing-state ((,class (:foreground ,nord-light11))))
    `(vc-needs-update-state ((,class (:foreground ,nord-light12))))
    `(vc-removed-state ((,class (:foreground ,nord-light11))))
    `(vc-state-base ((,class (:foreground ,nord-light4))))
    `(vc-up-to-date-state ((,class (:foreground ,nord-light8))))
    `(vertical-border ((,class (:foreground ,nord-light5))))
    `(which-func ((,class (:foreground ,nord-light8))))
    `(whitespace-big-indent ((,class (:foreground ,nord-light3 :background "#FFFFFF"))))
    `(whitespace-empty ((,class (:foreground ,nord-light3 :background "#FFFFFF"))))
    `(whitespace-hspace ((,class (:foreground ,nord-light3 :background "#FFFFFF"))))
    `(whitespace-indentation ((,class (:foreground ,nord-light3 :background "#FFFFFF"))))
    `(whitespace-line ((,class (:background "#FFFFFF"))))
    `(whitespace-newline ((,class (:foreground ,nord-light3 :background "#FFFFFF"))))
    `(whitespace-space ((,class (:foreground ,nord-light3 :background "#FFFFFF"))))
    `(whitespace-space-after-tab ((,class (:foreground ,nord-light3 :background "#FFFFFF"))))
    `(whitespace-space-before-tab ((,class (:foreground ,nord-light3 :background "#FFFFFF"))))
    `(whitespace-tab ((,class (:foreground ,nord-light3 :background "#FFFFFF"))))
    `(whitespace-trailing ((,class (:inherit trailing-whitespace))))
    `(widget-button-pressed ((,class (:foreground ,nord-light9 :background ,nord-light4))))
    `(widget-documentation ((,class (:foreground ,nord-light4))))
    `(widget-field ((,class (:background ,nord-light4 :foreground ,nord-light4))))
    `(widget-single-line-field ((,class (:background ,nord-light4 :foreground ,nord-light4))))
    `(window-divider ((,class (:background ,nord-light4))))
    `(window-divider-first-pixel ((,class (:background ,nord-light5))))
    `(window-divider-last-pixel ((,class (:background ,nord-light5))))

    ;;;; +-----------------+
    ;;;; + Package Support +
    ;;;; +-----------------+
    ;; +--- Syntax ---+
    ;; > Auctex
    `(font-latex-bold-face ((,class (:inherit bold))))
    `(font-latex-italic-face ((,class (:inherit italic))))
    `(font-latex-math-face ((,class (:foreground ,nord-light8))))
    `(font-latex-sectioning-0-face ((,class (:foreground ,nord-light8 :weight bold))))
    `(font-latex-sectioning-1-face ((,class (:inherit font-latex-sectioning-0-face))))
    `(font-latex-sectioning-2-face ((,class (:inherit font-latex-sectioning-0-face))))
    `(font-latex-sectioning-3-face ((,class (:inherit font-latex-sectioning-0-face))))
    `(font-latex-sectioning-4-face ((,class (:inherit font-latex-sectioning-0-face))))
    `(font-latex-sectioning-5-face ((,class (:inherit font-latex-sectioning-0-face))))
    `(font-latex-script-char-face ((,class (:inherit font-lock-warning-face))))
    `(font-latex-string-face ((,class (:inherit font-lock-string-face))))
    `(font-latex-warning-face ((,class (:inherit font-lock-warning-face))))

    ;; > Elixir
    `(elixir-attribute-face ((,class (:foreground ,nord-light-annotation))))
    `(elixir-atom-face ((,class (:foreground ,nord-light4 :weight bold))))

    ;; > Enhanced Ruby
    `(enh-ruby-heredoc-delimiter-face ((,class (:foreground ,nord-light14))))
    `(enh-ruby-op-face ((,class (:foreground ,nord-light9))))
    `(enh-ruby-regexp-delimiter-face ((,class (:foreground ,nord-light13))))
    `(enh-ruby-regexp-face ((,class (:foreground ,nord-light13))))
    `(enh-ruby-string-delimiter-face ((,class (:foreground ,nord-light14))))
    `(erm-syn-errline ((,class (:foreground ,nord-light11 :underline t))))
    `(erm-syn-warnline ((,class (:foreground ,nord-light13 :underline t))))

    ;; > Java Development Environment for Emacs
    `(jdee-db-active-breakpoint-face ((,class (:background ,nord-light4 :weight bold))))
    `(jdee-bug-breakpoint-cursor ((,class (:background ,nord-light4))))
    `(jdee-db-requested-breakpoint-face ((,class (:foreground ,nord-light13 :background ,nord-light4 :weight bold))))
    `(jdee-db-spec-breakpoint-face ((,class (:foreground ,nord-light14 :background ,nord-light4 :weight bold))))
    `(jdee-font-lock-api-face ((,class (:foreground ,nord-light4))))
    `(jdee-font-lock-code-face ((,class (:slant italic))))
    `(jdee-font-lock-constant-face ((,class (:foreground ,nord-light-keyword))))
    `(jdee-font-lock-constructor-face ((,class (:foreground ,nord-light-method))))
    `(jdee-font-lock-doc-tag-face ((,class (:foreground ,nord-light7))))
    `(jdee-font-lock-link-face ((,class (:underline t))))
    `(jdee-font-lock-modifier-face ((,class (:foreground ,nord-light-keyword))))
    `(jdee-font-lock-number-face ((,class (:foreground ,nord-light-numeric))))
    `(jdee-font-lock-operator-fac ((,class (:foreground ,nord-light-operator))))
    `(jdee-font-lock-package-face ((,class (:foreground ,nord-light-class))))
    `(jdee-font-lock-pre-face ((,class (:foreground ,nord-light-comment :slant italic))))
    `(jdee-font-lock-private-face ((,class (:foreground ,nord-light-keyword))))
    `(jdee-font-lock-public-face ((,class (:foreground ,nord-light-keyword))))
    `(jdee-font-lock-variable-face ((,class (:foreground ,nord-light-variable))))

    ;; > JavaScript 2
    `(js2-function-call ((,class (:foreground ,nord-light8))))
    `(js2-private-function-call ((,class (:foreground ,nord-light8))))
    `(js2-jsdoc-html-tag-delimiter ((,class (:foreground ,nord-light6))))
    `(js2-jsdoc-html-tag-name ((,class (:foreground ,nord-light9))))
    `(js2-external-variable ((,class (:foreground ,nord-light4))))
    `(js2-function-param ((,class (:foreground ,nord-light4))))
    `(js2-jsdoc-value ((,class (:foreground ,nord-light-comment))))
    `(js2-jsdoc-tag ((,class (:foreground ,nord-light7))))
    `(js2-jsdoc-type ((,class (:foreground ,nord-light7))))
    `(js2-private-member ((,class (:foreground ,nord-light4))))
    `(js2-object-property ((,class (:foreground ,nord-light4))))
    `(js2-error ((,class (:foreground ,nord-light11))))
    `(js2-warning ((,class (:foreground ,nord-light13))))
    `(js2-instance-member ((,class (:foreground ,nord-light4))))

    ;; > JavaScript 3
    `(js3-error-face ((,class (:foreground ,nord-light11))))
    `(js3-external-variable-face ((,class (:foreground ,nord-light4))))
    `(js3-function-param-face ((,class (:foreground ,nord-light4))))
    `(js3-instance-member-face ((,class (:foreground ,nord-light4))))
    `(js3-jsdoc-html-tag-delimiter-face ((,class (:foreground ,nord-light6))))
    `(js3-jsdoc-html-tag-name-face ((,class (:foreground ,nord-light9))))
    `(js3-jsdoc-tag-face ((,class (:foreground ,nord-light9))))
    `(js3-jsdoc-type-face ((,class (:foreground ,nord-light7))))
    `(js3-jsdoc-value-face ((,class (:foreground ,nord-light4))))
    `(js3-magic-paren-face ((,class (:inherit show-paren-match-face))))
    `(js3-private-function-call-face ((,class (:foreground ,nord-light8))))
    `(js3-private-member-face ((,class (:foreground ,nord-light4))))
    `(js3-warning-face ((,class (:foreground ,nord-light13))))

    ;; > Markdown
    `(markdown-blockquote-face ((,class (:foreground ,nord-light-comment))))
    `(markdown-bold-face ((,class (:inherit bold))))
    `(markdown-header-face-1 ((,class (:foreground ,nord-light8))))
    `(markdown-header-face-2 ((,class (:foreground ,nord-light8))))
    `(markdown-header-face-3 ((,class (:foreground ,nord-light8))))
    `(markdown-header-face-4 ((,class (:foreground ,nord-light8))))
    `(markdown-header-face-5 ((,class (:foreground ,nord-light8))))
    `(markdown-header-face-6 ((,class (:foreground ,nord-light8))))
    `(markdown-inline-code-face ((,class (:foreground ,nord-light7))))
    `(markdown-italic-face ((,class (:inherit italic))))
    `(markdown-link-face ((,class (:foreground ,nord-light8))))
    `(markdown-markup-face ((,class (:foreground ,nord-light9))))
    `(markdown-reference-face ((,class (:inherit markdown-link-face))))
    `(markdown-url-face ((,class (:foreground ,nord-light4 :underline t))))

    ;; > Rainbow Delimeters
    `(rainbow-delimiters-depth-1-face ((,class :foreground ,nord-light7)))
    `(rainbow-delimiters-depth-2-face ((,class :foreground ,nord-light8)))
    `(rainbow-delimiters-depth-3-face ((,class :foreground ,nord-light9)))
    `(rainbow-delimiters-depth-4-face ((,class :foreground ,nord-light10)))
    `(rainbow-delimiters-depth-5-face ((,class :foreground ,nord-light12)))
    `(rainbow-delimiters-depth-6-face ((,class :foreground ,nord-light13)))
    `(rainbow-delimiters-depth-7-face ((,class :foreground ,nord-light14)))
    `(rainbow-delimiters-depth-8-face ((,class :foreground ,nord-light15)))
    `(rainbow-delimiters-unmatched-face ((,class :foreground ,nord-light11)))

    ;; > Web Mode
    `(web-mode-attr-tag-custom-face ((,class (:foreground ,nord-light-attribute))))
    `(web-mode-builtin-face ((,class (:foreground ,nord-light-keyword))))
    `(web-mode-comment-face ((,class (:foreground ,nord-light-comment))))
    `(web-mode-comment-keyword-face ((,class (:foreground ,nord-light-comment))))
    `(web-mode-constant-face ((,class (:foreground ,nord-light-variable))))
    `(web-mode-css-at-rule-face ((,class (:foreground ,nord-light-annotation))))
    `(web-mode-css-function-face ((,class (:foreground ,nord-light-method))))
    `(web-mode-css-property-name-face ((,class (:foreground ,nord-light-keyword))))
    `(web-mode-css-pseudo-class-face ((,class (:foreground ,nord-light-class))))
    `(web-mode-css-selector-face ((,class (:foreground ,nord-light-keyword))))
    `(web-mode-css-string-face ((,class (:foreground ,nord-light-string))))
    `(web-mode-doctype-face ((,class (:foreground ,nord-light-preprocessor))))
    `(web-mode-function-call-face ((,class (:foreground ,nord-light-method))))
    `(web-mode-function-name-face ((,class (:foreground ,nord-light-method))))
    `(web-mode-html-attr-name-face ((,class (:foreground ,nord-light-attribute))))
    `(web-mode-html-attr-equal-face ((,class (:foreground ,nord-light-punctuation))))
    `(web-mode-html-attr-value-face ((,class (:foreground ,nord-light-string))))
    `(web-mode-html-entity-face ((,class (:foreground ,nord-light-keyword))))
    `(web-mode-html-tag-bracket-face ((,class (:foreground ,nord-light-punctuation))))
    `(web-mode-html-tag-custom-face ((,class (:foreground ,nord-light-tag))))
    `(web-mode-html-tag-face ((,class (:foreground ,nord-light-tag))))
    `(web-mode-html-tag-namespaced-face ((,class (:foreground ,nord-light-keyword))))
    `(web-mode-json-key-face ((,class (:foreground ,nord-light-class))))
    `(web-mode-json-string-face ((,class (:foreground ,nord-light-string))))
    `(web-mode-keyword-face ((,class (:foreground ,nord-light-keyword))))
    `(web-mode-preprocessor-face ((,class (:foreground ,nord-light-preprocessor))))
    `(web-mode-string-face ((,class (:foreground ,nord-light-string))))
    `(web-mode-symbol-face ((,class (:foreground ,nord-light-variable))))
    `(web-mode-type-face ((,class (:foreground ,nord-light-class))))
    `(web-mode-warning-face ((,class (:inherit ,font-lock-warning-face))))
    `(web-mode-variable-name-face ((,class (:foreground ,nord-light-variable))))

    ;; +--- UI ---+
    ;; > Anzu
    `(anzu-mode-line ((,class (:foreground, nord-light8))))
    `(anzu-mode-line-no-match ((,class (:foreground, nord-light11))))

    ;; > Avy
    `(avy-lead-face ((,class (:background ,nord-light11 :foreground ,nord-light5))))
    `(avy-lead-face-0 ((,class (:background ,nord-light10 :foreground ,nord-light5))))
    `(avy-lead-face-1 ((,class (:background ,nord-light3 :foreground ,nord-light5))))
    `(avy-lead-face-2 ((,class (:background ,nord-light15 :foreground ,nord-light5))))

    ;; > Company
    `(company-echo-common ((,class (:foreground ,nord-light0 :background ,nord-light4))))
    `(company-preview ((,class (:foreground ,nord-light4 :background ,nord-light10))))
    `(company-preview-common ((,class (:foreground ,nord-light0 :background ,nord-light8))))
    `(company-preview-search ((,class (:foreground ,nord-light0 :background ,nord-light8))))
    `(company-scrollbar-bg ((,class (:foreground ,nord-light1 :background ,nord-light4))))
    `(company-scrollbar-fg ((,class (:foreground ,nord-light2 :background ,nord-light4))))
    `(company-template-field ((,class (:foreground ,nord-light0 :background ,nord-light7))))
    `(company-tooltip ((,class (:foreground ,nord-light3 :background ,nord-light4))))
    `(company-tooltip-annotation ((,class (:foreground ,nord-light12))))
    `(company-tooltip-annotation-selection ((,class (:foreground ,nord-light12 :weight bold))))
    `(company-tooltip-common ((,class (:foreground ,nord-light8))))
    `(company-tooltip-common-selection ((,class (:foreground ,nord-light8 :background ,nord-light3))))
    `(company-tooltip-mouse ((,class (:inherit highlight))))
    `(company-tooltip-selection ((,class (:background ,nord-light3 :weight bold))))

    ;; > diff-hl
   `(diff-hl-change ((,class (:background ,nord-light13))))
   `(diff-hl-insert ((,class (:background ,nord-light14))))
   `(diff-hl-delete ((,class (:background ,nord-light11))))
   
    ;; > Evil
    `(evil-ex-info ((,class (:foreground ,nord-light8))))
    `(evil-ex-substitute-replacement ((,class (:foreground ,nord-light9))))
    `(evil-ex-substitute-matches ((,class (:inherit isearch))))

    ;; > Flycheck
    `(flycheck-error ((,class (:underline (:style wave :color ,nord-light11)))))
    `(flycheck-fringe-error ((,class (:foreground ,nord-light11 :weight bold))))
    `(flycheck-fringe-info ((,class (:foreground ,nord-light8 :weight bold))))
    `(flycheck-fringe-warning ((,class (:foreground ,nord-light13 :weight bold))))
    `(flycheck-info ((,class (:underline (:style wave :color ,nord-light8)))))
    `(flycheck-warning ((,class (:underline (:style wave :color ,nord-light13)))))

    ;; > Git Gutter
    `(git-gutter:modified ((,class (:foreground ,nord-light13))))
    `(git-gutter:added ((,class (:foreground ,nord-light14))))
    `(git-gutter:deleted ((,class (:foreground ,nord-light11))))

    ;; > Git Gutter Plus
    `(git-gutter+-modified ((,class (:foreground ,nord-light13))))
    `(git-gutter+-added ((,class (:foreground ,nord-light14))))
    `(git-gutter+-deleted ((,class (:foreground ,nord-light11))))

    ;; > Helm
    `(helm-bookmark-addressbook ((,class (:foreground ,nord-light7))))
    `(helm-bookmark-directory ((,class (:foreground ,nord-light9))))
    `(helm-bookmark-file ((,class (:foreground ,nord-light8))))
    `(helm-bookmark-gnus ((,class (:foreground ,nord-light10))))
    `(helm-bookmark-info ((,class (:foreground ,nord-light14))))
    `(helm-bookmark-man ((,class (:foreground ,nord-light4))))
    `(helm-bookmark-w3m ((,class (:foreground ,nord-light9))))
    `(helm-buffer-directory ((,class (:foreground ,nord-light9))))
    `(helm-buffer-file ((,class (:foreground ,nord-light8))))
    `(helm-buffer-not-saved ((,class (:foreground ,nord-light13))))
    `(helm-buffer-process ((,class (:foreground ,nord-light10))))
    `(helm-candidate-number ((,class (:foreground ,nord-light4 :weight bold))))
    `(helm-candidate-number-suspended ((,class (:foreground ,nord-light4))))
    `(helm-ff-directory ((,class (:foreground ,nord-light9 :weight bold))))
    `(helm-ff-dirs ((,class (:foreground ,nord-light9))))
    `(helm-ff-dotted-director ((,class (:foreground ,nord-light9 :underline t))))
    `(helm-ff-dotted-symlink-director ((,class (:foreground ,nord-light7 :weight bold))))
    `(helm-ff-executable ((,class (:foreground ,nord-light8))))
    `(helm-ff-file ((,class (:foreground ,nord-light4))))
    `(helm-ff-invalid-symlink ((,class (:foreground ,nord-light11 :weight bold))))
    `(helm-ff-prefix ((,class (:foreground ,nord-light0 :background ,nord-light9))))
    `(helm-ff-symlink ((,class (:foreground ,nord-light7))))
    `(helm-grep-cmd-line ((,class (:foreground ,nord-light4 :background "#FFFFFF"))))
    `(helm-grep-file ((,class (:foreground ,nord-light8))))
    `(helm-grep-finish ((,class (:foreground ,nord-light5))))
    `(helm-grep-lineno ((,class (:foreground ,nord-light4))))
    `(helm-grep-match ((,class (:inherit isearch))))
    `(helm-grep-running ((,class (:foreground ,nord-light8))))
    `(helm-header ((,class (:foreground ,nord-light9 :background ,nord-light4))))
    `(helm-header-line-left-margin ((,class (:foreground ,nord-light9 :background ,nord-light4))))
    `(helm-history-deleted ((,class (:foreground ,nord-light11))))
    `(helm-history-remote ((,class (:foreground ,nord-light4))))
    `(helm-lisp-completion-info ((,class (:foreground ,nord-light4 :weight bold))))
    `(helm-lisp-show-completion ((,class (:inherit isearch))))
    `(helm-locate-finish ((,class (:foreground ,nord-light14))))
    `(helm-match ((,class (:foreground ,nord-light8))))
    `(helm-match-item ((,class (:inherit isearch))))
    `(helm-moccur-buffer ((,class (:foreground ,nord-light8))))
    `(helm-resume-need-update ((,class (:foreground ,nord-light0 :background ,nord-light13))))
    `(helm-selection ((,class (:inherit highlight))))
    `(helm-selection-line ((,class (:background ,nord-light4))))
    `(helm-source-header ((,class (:height 1.44 :foreground ,nord-light8 :background ,nord-light4))))
    `(helm-swoop-line-number-face ((,class (:foreground ,nord-light4 :background "#FFFFFF"))))
    `(helm-swoop-target-word-face ((,class (:foreground ,nord-light0 :background ,nord-light7))))
    `(helm-swoop-target-line-face ((,class (:background ,nord-light13 :foreground ,nord-light3))))
    `(helm-swoop-target-line-block-face ((,class (:background ,nord-light13 :foreground ,nord-light3))))
    `(helm-separator ((,class (:background ,nord-light4))))
    `(helm-visible-mark ((,class (:background ,nord-light4))))

    ;; > Magit
    `(magit-branch ((,class (:foreground ,nord-light7 :weight bold))))
    `(magit-diff-context-highlight ((,class (:background ,nord-light4))))
    `(magit-diff-file-header ((,class (:foreground ,nord-light8 :box (:color ,nord-light8)))))
    `(magit-diffstat-added ((,class (:foreground ,nord-light14))))
    `(magit-diffstat-removed ((,class (:foreground ,nord-light11))))
    `(magit-hash ((,class (:foreground ,nord-light8))))
    `(magit-hunk-heading ((,class (:foreground ,nord-light9))))
    `(magit-hunk-heading-highlight ((,class (:foreground ,nord-light9 :background ,nord-light4))))
    `(magit-item-highlight ((,class (:foreground ,nord-light8 :background ,nord-light4))))
    `(magit-log-author ((,class (:foreground ,nord-light7))))
    `(magit-process-ng ((,class (:foreground ,nord-light13 :weight bold))))
    `(magit-process-ok ((,class (:foreground ,nord-light14 :weight bold))))
    `(magit-section-heading ((,class (:foreground ,nord-light7 :weight bold))))
    `(magit-section-highlight ((,class (:background ,nord-light4))))

    ;; > MU4E
    `(mu4e-header-marks-face ((,class (:foreground ,nord-light9))))
    `(mu4e-title-face ((,class (:foreground ,nord-light8))))
    `(mu4e-header-key-face ((,class (:foreground ,nord-light8))))
    `(mu4e-highlight-face ((,class (:highlight))))
    `(mu4e-flagged-face ((,class (:foreground ,nord-light13))))
    `(mu4e-unread-face ((,class (:foreground ,nord-light13 :weight bold))))
    `(mu4e-link-face ((,class (:underline t))))

    ;; > Powerline
    `(powerline-active1 ((,class (:foreground ,nord-light4 :background ,nord-light10))))
    `(powerline-active2 ((,class (:foreground ,nord-light4 :background ,nord-light10))))
    `(powerline-inactive1 ((,class (:background ,nord-light4))))
    `(powerline-inactive2 ((,class (:background ,nord-light4))))

    ;; > Powerline Evil
    `(powerline-evil-base-face ((,class (:foreground ,nord-light4))))
    `(powerline-evil-normal-face ((,class (:background ,nord-light15))))
    `(powerline-evil-insert-face ((,class (:foreground ,nord-light4 :background ,nord-light10))))
    `(powerline-evil-visual-face ((,class (:foreground ,nord-light4 :background ,nord-light10))))
    `(powerline-evil-replace-face ((,class (:foreground ,nord-light4 :background ,nord-light10))))

    ;; > NeoTree
    `(neo-banner-face ((,class (:foreground ,nord-light10))))
    `(neo-dir-link-face ((,class (:foreground ,nord-light9))))
    `(neo-expand-btn-face ((,class (:foreground ,nord-light6 :bold t))))
    `(neo-file-link-face ((,class (:foreground ,nord-light4))))
    `(neo-root-dir-face ((,class (:foreground ,nord-light7 :weight bold))))
    `(neo-vc-added-face ((,class (:foreground ,nord-light14))))
    `(neo-vc-conflict-face ((,class (:foreground ,nord-light11))))
    `(neo-vc-default-face ((,class (:foreground ,nord-light4))))
    `(neo-vc-edited-face ((,class (:foreground ,nord-light13))))
    `(neo-vc-ignored-face ((,class (:foreground ,nord-light3))))
    `(neo-vc-missing-face ((,class (:foreground ,nord-light12))))
    `(neo-vc-needs-merge-face ((,class (:background ,nord-light12 :foreground ,nord-light4))))
    `(neo-vc-needs-update-face ((,class (:background ,nord-light10 :foreground ,nord-light4))))
    `(neo-vc-removed-face ((,class (:foreground ,nord-light11 :strike-through nil))))
    `(neo-vc-up-to-date-face ((,class (:foreground ,nord-light4))))
    `(neo-vc-user-face ((,class (:foreground ,nord-light4))))

    ;; > Cider
    `(cider-result-overlay-face ((t (:background unspecified))))

    ;; > Org
    `(org-level-1 ((,class (:foreground ,nord-light7 :weight extra-bold))))
    `(org-level-2 ((,class (:foreground ,nord-light8 :weight bold))))
    `(org-level-3 ((,class (:foreground ,nord-light9 :weight semi-bold))))
    `(org-level-4 ((,class (:foreground ,nord-light10 :weight normal))))
    `(org-level-5 ((,class (:inherit org-level-4))))
    `(org-level-6 ((,class (:inherit org-level-4))))
    `(org-level-7 ((,class (:inherit org-level-4))))
    `(org-level-8 ((,class (:inherit org-level-4))))
    `(org-agenda-structure ((,class (:foreground ,nord-light9))))
    `(org-agenda-date ((,class (:foreground ,nord-light8 :underline nil))))
    `(org-agenda-done ((,class (:foreground ,nord-light14))))
    `(org-agenda-dimmed-todo-face ((,class (:background ,nord-light13))))
    `(org-block ((,class (:foreground ,nord-light3 :background ,nord-light6))))
    `(org-block-background ((,class (:background ,nord-light5))))
    `(org-block-begin-line ((,class (:foreground ,nord-light9 :background ,nord-light6))))
    `(org-block-end-line ((,class (:foreground ,nord-light9 :background ,nord-light6))))
    `(org-checkbox ((,class (:foreground ,nord-light9))))
    `(org-checkbox-statistics-done ((,class (:foreground ,nord-light14))))
    `(org-checkbox-statistics-todo ((,class (:foreground ,nord-light13))))
    `(org-code ((,class (:foreground ,nord-light7))))
    `(org-column ((,class (:background ,nord-light4))))
    `(org-column-title ((,class (:inherit org-column :weight bold :underline t))))
    `(org-date ((,class (:foreground ,nord-light8))))
    `(org-document-info ((,class (:foreground ,nord-light4))))
    `(org-document-info-keyword ((,class (:foreground ,nord-light3 :weight bold))))
    `(org-document-title ((,class (:foreground ,nord-light8 :weight bold))))
    `(org-done ((,class (:foreground ,nord-light14 :weight bold))))
    `(org-ellipsis ((,class (:foreground ,nord-light3))))
    `(org-footnote ((,class (:foreground ,nord-light8))))
    `(org-formula ((,class (:foreground ,nord-light9))))
    `(org-hide ((,class (:foreground ,nord-light0 :background "#FFFFFF"))))
    `(org-link ((,class (:underline t))))
    `(org-scheduled ((,class (:foreground ,nord-light14))))
    `(org-scheduled-previously ((,class (:foreground ,nord-light13))))
    `(org-scheduled-today ((,class (:foreground ,nord-light8))))
    `(org-special-keyword ((,class (:foreground ,nord-light9))))
    `(org-table ((,class (:foreground ,nord-light9))))
    `(org-todo ((,class (:foreground ,nord-light13 :weight bold))))
    `(org-upcoming-deadline ((,class (:foreground ,nord-light12))))
    `(org-warning ((,class (:foreground ,nord-light13 :weight bold))))
    `(font-latex-bold-face ((,class (:inherit bold))))
    `(font-latex-italic-face ((,class (:slant italic))))
    `(font-latex-string-face ((,class (:foreground ,nord-light14))))
    `(font-latex-match-reference-keywords ((,class (:foreground ,nord-light9))))
    `(font-latex-match-variable-keywords ((,class (:foreground ,nord-light4))))
    `(ido-only-match ((,class (:foreground ,nord-light8))))
    `(org-sexp-date ((,class (:foreground ,nord-light7))))
    `(ido-first-match ((,class (:foreground ,nord-light8 :weight bold))))
    `(ido-subdir ((,class (:foreground ,nord-light9))))
    `(org-quote ((,class (:inherit org-block :slant italic))))
    `(org-verse ((,class (:inherit org-block :slant italic))))
    `(org-agenda-date-weekend ((,class (:foreground ,nord-light9))))
    `(org-agenda-date-today ((,class (:foreground ,nord-light8 :weight bold))))
    `(org-agenda-done ((,class (:foreground ,nord-light14))))
    `(org-verbatim ((,class (:foreground ,nord-light7))))

    ;; > ivy-mode
    `(ivy-current-match ((,class (:inherit region))))
    `(ivy-minibuffer-match-face-1 ((,class (:inherit default))))
    `(ivy-minibuffer-match-face-2 ((,class (:background ,nord-light7 :foreground ,nord-light0))))
    `(ivy-minibuffer-match-face-3 ((,class (:background ,nord-light8 :foreground ,nord-light0))))
    `(ivy-minibuffer-match-face-4 ((,class (:background ,nord-light9 :foreground ,nord-light0))))
    `(ivy-remote ((,class (:foreground ,nord-light14))))
    `(ivy-posframe ((,class (:background ,nord-light5))))
    `(ivy-posframe-border ((,class (:background ,nord-light5))))
    `(ivy-remote ((,class (:foreground ,nord-light14))))

    ;; > perspective
    `(persp-selected-face ((,class (:foreground ,nord-light8 :weight bold))))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
    (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'nord-light)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; nord-light-theme.el ends here
