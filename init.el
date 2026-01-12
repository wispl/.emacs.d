;;; init.el -*- lexical-binding: t; -*-
;;;
;;
;; A fledging bird's emacs config
;;
;;    ⠀⠀⠀⠀⠀⠀⢀⣠⠴⠒⠒⠒⠒⠒⠶⠦⠤⠴⠒⠚⠉⣰⠟⠁⠀⠀⠀⠀⠀⠀
;;    ⠀⠀⠀⠀⢀⡞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀
;;    ⠀⠀⠀⢠⡿⣤⣄⠀⠀⠀⠀⠀⢀⣤⣄⠀⠀⠀⣰⠞⠁⠀⠀⠀⢠⣤⠀⠀⠀⠀
;;    ⠀⠀⢠⡟⠸⣿⡿⢀⠤⢄⠀⠐⣷⣿⣿⡷⠀⠀⢻⠀⠀⠀⢀⡴⠋⠘⡇⠀⠀⠀
;;    ⠀⠀⢸⠈⠲⡬⢠⡏⠀⢀⡷⠀⠨⣭⠭⠖⣇⠀⣾⠀⠀⡴⠋⠀⠀⠀⣧⠀⠀⠀
;;    ⠀⠀⢸⣷⠞⠁⠀⠳⠖⠋⠀⠀⠀⠙⠶⠶⠃⡼⢿⣠⠎⠀⠀⠀⠀⠀⣿⠀⠀⠀
;;    ⠀⠀⢸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡾⠃⠀⠀⠀⠀⠀⠀⡟⠀⠀⠀
;;    ⠀⠀⡼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡄⠀⠀⠀⠀⠀⢠⠃⠀⠀⠄
;;    ⢀⣰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠉⠉⠉⠉⠲⢄⡀⢀⣠⡷⠀⠀⢠
;;    ⢸⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⠧⠤⢾⢀⠏
;;    ⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⠏⠀
;;    ⢸⠀⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡏⠀⠀
;;    ⠈⢷⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠢⡀⠀⠀⠀⠀⠀⠀⢀⣤⡏⠀⠀⠀
;;    ⠀⠈⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠲⠶⠶⠖⠊⠁⣴⠇⠀⠀⠀
;;    ⠀⠀⠘⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⠁⠀⠀⠀⠀
;;    ⠀⠀⠀⠈⠻⢦⣀⠀⠀⠀⠀⠀⠀⣠⣎⡀⡀⠀⠀⣀⣰⢶⠶⠚⠁⠀⠀⠀⠀⠀
;;    ⠀⠀⠀⠀⣰⠛⠉⡙⠛⢛⣷⠖⠒⢖⣾⠟⢛⠛⠺⣿⣏⠁⠀⠀⠀⠀⠀⠀⠀⠀
;;
;;;
;;; Be forewarned, I have no idea what I am doing...
;;;
;;; Init time recording... just for fun. This was taken from
;;; https://gist.github.com/rougier/8d5a712aa43e3cc69e7b0e325c84eab4
;; (defconst init-start-time (current-time))
;; TODO: open dashboard, or maybe agenda.org, or even org-agenda at startup?
;; (defun my/init-benchmark ()
;;   (let ((init-time (float-time (time-subtract (current-time) init-start-time)))
;; 	(total-time (string-to-number (emacs-init-time "%f"))))
;;     (message (concat
;; 	      (propertize "Startup time: " 'face 'bold)
;; 	      (format "%.2fs " init-time)
;; 	      (propertize (format "(+ %.2fs system time)"
;; 				  (- total-time init-time)) 'face 'shadow)))))
;; (add-hook 'after-init-hook #'my/init-benchmark t)
;;;
;;; Use package.el for configuration, I think it is good enough for me right
;;; now. In general, I avoid :init and :custom as much as possible unless
;;; it is to set some values.
;;;
;;; :custom is avoided because it for some reason slows startup, I think there
;;; is a distinction between :custom and :config, namely setq vs setopt but I am
;;; too much of a fledging to understand its consequences for now...
;;;
;;; Since I don't want to deal with org mode and tangling, I instead opt for
;;; providing descriptions in the comments. Each section has a "flag" which can
;;; easily be searched for, like this: |* Section.
;;;
;;; For :hook, I avoid the shorthand for consistency so even if :hook (blah)
;;; works, I would type out :hook (blah . pack-mode).
;;;
;;;
;;; Lazy load by default
(setq use-package-always-defer t)
;;; Package configuration: add MELPA and always defer packages
(with-eval-after-load 'package (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
(defvar doom-incremental-packages '(t)
  "A list of packages to load incrementally after startup. Any large packages
here may cause noticeable pauses, so it's recommended you break them up into
sub-packages. For example, `org' is comprised of many packages, and can be
broken up into:
  (doom-load-packages-incrementally
   '(calendar find-func format-spec org-macs org-compat
     org-faces org-entities org-list org-pcomplete org-src
     org-footnote org-macro ob org org-clock org-agenda
     org-capture))
This is already done by the lang/org module, however.
If you want to disable incremental loading altogether, either remove
`doom-load-packages-incrementally-h' from `emacs-startup-hook' or set
`doom-incremental-first-idle-timer' to nil.")

(defvar doom--deferred-packages-alist '(t))

(defvar doom-incremental-first-idle-timer 2.0
  "How long (in idle seconds) until incremental loading starts.
Set this to nil to disable incremental loading.")

(defvar doom-incremental-idle-timer 0.75
  "How long (in idle seconds) in between incrementally loading packages.")

(defvar doom-incremental-load-immediately nil
  ;; (daemonp)
  "If non-nil, load all incrementally deferred packages immediately at startup.")
  
(defvar doom-inhibit-log (not (or noninteractive init-file-debug))
  "If non-nil, suppress `message' output.")

(defmacro appendq! (sym &rest lists)
  "Append LISTS to SYM in place."
  `(setq ,sym (append ,sym ,@lists)))
  
(defmacro delq! (elt list &optional fetcher)
  "`delq' ELT from LIST in-place.

If FETCHER is a function, ELT is used as the key in LIST (an alist)."
  `(setq ,list (delq ,(if fetcher
                          `(funcall ,fetcher ,elt ,list)
                        elt)
                     ,list)))
		     
(defun doom-load-packages-incrementally (packages &optional now)
  "Registers PACKAGES to be loaded incrementally.
If NOW is non-nil, load PACKAGES incrementally, in `doom-incremental-idle-timer'
intervals."
  (if (not now)
      (appendq! doom-incremental-packages packages)
    (while packages
      (let ((req (pop packages)))
        (unless (featurep req)
          (message "Incrementally loading %s" req)
          (condition-case e
              (or (while-no-input
                    ;; If `default-directory' is a directory that doesn't exist
                    ;; or is unreadable, Emacs throws up file-missing errors, so
                    ;; we set it to a directory we know exists and is readable.
                    (let ((default-directory user-emacs-directory)
                          (gc-cons-threshold most-positive-fixnum)
                          file-name-handler-alist)
                      (require req nil t))
                    t)
                  (push req packages))
            ((error debug)
             (message "Failed to load '%s' package incrementally, because: %s"
                      req e)))
          (if (not packages)
              (message "Finished incremental loading")
            (run-with-idle-timer doom-incremental-idle-timer
                                 nil #'doom-load-packages-incrementally
                                 packages t)
            (setq packages nil)))))))

(defun doom-load-packages-incrementally-h ()
  "Begin incrementally loading packages in `doom-incremental-packages'.
If this is a daemon session, load them all immediately instead."
  (if doom-incremental-load-immediately
      (mapc #'require (cdr doom-incremental-packages))
    (when (numberp doom-incremental-first-idle-timer)
      (run-with-idle-timer doom-incremental-first-idle-timer
                           nil #'doom-load-packages-incrementally
                           (cdr doom-incremental-packages) t))))
(add-hook 'emacs-startup-hook #'doom-load-packages-incrementally-h)

;; Adds two keywords to `use-package' to expand its lazy-loading capabilities:
;;
;;   :after-call SYMBOL|LIST
;;   :defer-incrementally SYMBOL|LIST|t
;;
;; Check out `use-package!'s documentation for more about these two.
(with-eval-after-load 'use-package-core
  (dolist (keyword '(:defer-incrementally :after-call))
    (push keyword use-package-deferring-keywords)
    (setq use-package-keywords
          (use-package-list-insert keyword use-package-keywords :after)))

  (defalias 'use-package-normalize/:defer-incrementally #'use-package-normalize-symlist)
  (defun use-package-handler/:defer-incrementally (name _keyword targets rest state)
    (use-package-concat
     `((doom-load-packages-incrementally
        ',(if (equal targets '(t))
	      (list name)
            (append targets (list name)))))
     (use-package-process-keywords name rest state)))
  
  (defalias 'use-package-normalize/:after-call #'use-package-normalize-symlist)
  (defun use-package-handler/:after-call (name _keyword hooks rest state)
    (if (plist-get state :demand)
        (use-package-process-keywords name rest state)
      (let ((fn (make-symbol (format "doom--after-call-%s-h" name))))
        (use-package-concat
         `((fset ',fn
                 (lambda (&rest _)
                   (message "use-package: lazy loading %s from %s" ',name ',fn)
                   (condition-case e
		       ;; If `default-directory' is a directory that doesn't
		       ;; exist or is unreadable, Emacs throws up file-missing
		       ;; errors, so we set it to a directory we know exists and
		       ;; is readable.
		       (let ((default-directory user-emacs-directory))
                         (require ',name))
                     ((debug error)
		      (message "Failed to load deferred package %s: %s" ',name e)))
                   (when-let (deferral-list (assq ',name doom--deferred-packages-alist))
                     (dolist (hook (cdr deferral-list))
		       (advice-remove hook #',fn)
		       (remove-hook hook #',fn))
                     (delq! deferral-list doom--deferred-packages-alist)
                     (unintern ',fn nil)))))
         (let (forms)
           (dolist (hook hooks forms)
             (push (if (string-match-p "-\\(?:functions\\|hook\\)$" (symbol-name hook))
		       `(add-hook ',hook #',fn)
                     `(advice-add #',hook :before #',fn))
                   forms)))
         `((unless (assq ',name doom--deferred-packages-alist)
             (push '(,name) doom--deferred-packages-alist))
           (nconc (assq ',name doom--deferred-packages-alist)
                  '(,@hooks)))
         (use-package-process-keywords name rest state))))))
;;;
;;; Nice defaults
(setq-default fill-column 80)
(setq use-file-dialog nil
      tab-bar-new-button ""
      tab-bar-close-button-show nil
      tab-bar-back-button ""
      tab-bar-auto-width nil
      tab-bar-separator "    "
      ;; I find these clunky to use, and backups of the files themselves can be
      ;; potentially dangerous to have floating around.
      make-backup-files nil
      create-lockfiles nil
      ;; No need to have duplicates...
      kill-do-not-save-duplicates t
      ;; Vertical splits over horizontal ones
      split-width-threshold nil
      split-height-threshold 160)
;; TODO: saveplace-mode and save-hist-mode
(blink-cursor-mode -1)
(global-hl-line-mode 1)
;;
;; From Doom, this saves some space when using splits
(setq window-divider-default-places t
      window-divider-default-bottom-width 1
      window-divider-default-right-width 1)
(add-hook 'on-init-ui-hook #'window-divider-mode)
;;
;; Truncate lines instead of wrapping when in prog mode, but wrap
;; lines in text like formats (like latex and regular text)
(add-hook 'prog-mode-hook (lambda() (setq truncate-lines t)))
(add-hook 'TeX-mode-hook #'visual-line-mode)
(add-hook 'text-mode-hook #'visual-line-mode)
;;
;; Set encoding
(set-language-environment "UTF-8")
(setq default-input-method nil)
;;
;; Don't render stuff in inactive windows, distracting...
(setq cursor-in-non-selected-windows nil
      highlight-nonselected-windows nil)
;;
;; Scrolling
(setq scroll-step 1
      auto-window-vscroll nil
      ;; scroll off
      scroll-margin 7)
;; For corfu, note that 'complete removes inserting tabs... a hefty price
;; But you can still indent so it is fine: indent with tabs align with spaces
(setq tab-always-indent 'complete
      text-mode-ispell-word-completion nil)
;;
;; Recommend by vertico and good defaults too
;; 
;; Enable context menu. `vertico-multiform-mode' adds a menu in the minibuffer
;; to switch display modes.
(setq context-menu-mode t)
;; Support opening new minibuffers from inside existing minibuffers.
(setq enable-recursive-minibuffers t)
;;
;; Hide commands in M-x which do not work in the current mode.  Vertico
;; commands are hidden in normal buffers. This setting is useful beyond
;; Vertico.
(setq read-extended-command-predicate #'command-completion-default-include-p)
;;
;; Do not allow the cursor in the minibuffer prompt
(setq minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt))
;;
;; Properly deletes tabs
(setq backward-delete-char-untabify-method nil)
;;
;; Font
(add-to-list 'default-frame-alist '(font ."FantasqueSansM Nerd Font Mono-20"))
;;
;; Move custom stuff elsewhere and don't load them, I prefer
;; customizing through code. This cause problems down the road...
(setq custom-file "~/.config/emacs/custom.el")
;;
;; Performance!!!!!! Most of these were pilfered from Doom.
;; Not really needed, disabling saves some time.
(setq auto-mode-case-fold nil)
;; Don't really use these so setting these should be fine
(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right)
(setq bidi-inhibit-bpa t)
;; Helps with scrolling performance
(setq redisplay-skip-fontification-on-input t)
;;
;; I actually have no idea how to work this
(setq display-buffer-alist
      '(
	;; Make warnings, logs, and erros open on the bottom
	("\\*\\(?:Warnings\\|Compile-Log\\|Flymake diagnostics.*\\)\\*"
	 (display-buffer-in-side-window)
	 (window-height . 0.30)
	 (side . bottom)
	 (direction . below)
	 (slot . -1)
	 (window-parameters . ((split-window . #'ignore))))
	;; Preview pdfs in the sidebar
	;; ("\\.pdf\\'"
	((major-mode . pdf-view-mode)
	 (display-buffer-reuse-mode-window display-buffer-in-side-window)
	 (window-width . 0.45)
	 (side . right)
	 (slot . 1))))
;;;
;;
;; |* Startup
;;
;;; Use general for keybindings, as recommended, :general is used for
;;; keybinds which load the package, and :general-config is used for
;;; everything else. In practice I prefer :config over :general-config.
(use-package general
  :ensure t
  ;; This module is needed immediately, everything depends on it since it is
  ;; used for keybindings via :general and :general-config.
  :demand t
  :config
  ;; Leader keys, set to space by default
  (general-create-definer leader-keys
    :states '(normal visual)
    :keymaps 'override
    :prefix "SPC")
  (general-create-definer localleader-keys
    :states '(normal visual)
    :prefix "SPC l"))
;;
;;; Little package to add extra hooks like on-first-input and
;;; on-init-ui-hook. This mirrors doom emacs style and prevents blanket
;;; after-init-hooks.
(use-package on
  :ensure t
  ;; Load immediately so the hooks are available
  :demand t)
;;;
;;; Colorscheme
;;; TODO: Use custom-face? not sure what are the advantages
(use-package kanagawa-themes
  :ensure t
  :demand t
  :hook
  (diff-hl-mode . (lambda()
		    ;; Set these ourselves since they are not really defined in kanagawa-dragon
		    (set-face-attribute 'diff-hl-insert nil :foreground "#87a987" :background "unspecified")
		    (set-face-attribute 'diff-hl-change nil :foreground "#e6c384" :background "unspecified")
		    (set-face-attribute 'diff-hl-delete nil :foreground "#e46876" :background "unspecified")))
  :config
  (setq kanagawa-themes-comment-italic t)
  (load-theme 'kanagawa-dragon t)
  (set-face-background 'header-line "#1d1c19")
  (set-face-background 'mode-line-active "#1d1c19")
  (set-face-background 'mode-line-inactive "#1d1c19"))
;;;
;;
;; |* Core
;;
;;; Builtin packages which just need a little more configuration.
;;;
;;; which-key, no introduction needed
(use-package which-key
  :ensure nil
  :hook (on-first-input . which-key-mode))
;;
;; Little quality of life for dired
(use-package dired
  :ensure nil
  :commands dired-jump
  :init
  (setq dired-dwim-target t)
  :config
  (setq dired-listing-switches "-Ahl -v --group-directories-first"))
;;;
;;; project, also no introduction needed
(use-package project
  :ensure nil
  :general
  (leader-keys
    :infix "p"
    "d" '("project diagnostics" . flymake-show-project-diagnostics)
    "r" '("project recompile" . project-recompile)
    "c" '("project compile" . project-compile)
    "p" '("project projects" . project-switch-project)
    "x" '("project kill buffers" . project-kill-buffers)
    "f" '("project files" . project-find-file)
    "s" '("project search" . project-search)))
;;;
;;; For when I don't need a full terminal, although eshell can integrate with
;;; eat if need be.
(use-package eshell
  :ensure nil
  :general
  (leader-keys "oe" '("open eshell" . eshell)))
;;;
;;; Syntax checking on the fly. Flycheck might be better, but a good amount of
;;; packages I am using right now defaults to flymake. It is also builtin...
(use-package flymake
  :ensure nil
  ;; Use config because usually flymake already gets loaded by some other modes
  ;; so we just have to load the keybindings.
  :config
  (leader-keys "od" '("open diagnostic" . flymake-show-buffer-diagnostics))
  (general-def 'normal
    "]d" '("next diagnostic" . flymake-goto-next-error)
    "[d" '("previous diagnostic" . flymake-goto-prev-error)))
;;;
;;; Recent files for recent stuff
(use-package recentf
  :ensure nil
  :hook (on-first-file-hook . recentf-mode)
  :commands recentf-open-files
  :config
  (setq recentf-auto-cleanup nil
	recentf-max-saved-items 50)
  ;; From doom, don't add string properties (no purpose for them)
  (add-to-list 'recentf-filename-handlers #'substring-no-properties)
  ;; From doom, clean recentf at exit unless it is a daemon 
  (setq recentf-auto-cleanup (if (daemonp) 300))
  (add-hook 'kill-emacs-hook #'recentf-cleanup))
;;
;; Nicer tabs
(use-package tab-bar
  :ensure nil
  :commands tab-new
  :config
  ;; Better colors and no ugly boxes
  (set-face-attribute 'tab-bar nil :background "unspecified" :inherit 'default)
  (set-face-attribute 'tab-bar-tab-inactive nil :background "unspecified" :inherit 'font-lock-comment-face)
  (set-face-attribute 'tab-bar-tab nil :background "unspecified" :inherit 'default :box nil)
  ;; Top padding, clean up buttons, add icon, and sleeker tabs
  (defun tab-bar-top-pad () (propertize " " 'display' (raise +0.45)))
  (defun tab-bar-icon () (propertize "󰧭" 'face '(:inherit 'default :height 300) 'display' (raise -0.10)))

  (setq tab-bar-format (butlast tab-bar-format))
  (add-to-list 'tab-bar-format 'tab-bar-icon)
  (add-to-list 'tab-bar-format 'tab-bar-top-pad t))
;;;
;;; Window rules
;;;
;;
;; |* Evil
;;
;;; TODO: Majority of load time is due to evil mode, maybe find a way to lazy
;;; load this better?
;;;
;;; Vim emulation via evil
(use-package evil
  :ensure t
  ;; This is risky, we have to ensure evil is loaded before other modules
  ;; (except general.el and on.el) of course, but it is not too hard, in
  ;; practice, this should mean anything using emacs-startup hook should load
  ;; after evil, if it depends on evil.
  :hook (emacs-startup . evil-mode)
  :init
  ;; We want these loaded before evil is loaded so set them in init.  Well,
  ;; it is fine for some of them to be loaded later, but ... I am not smart
  ;; enough to know which ones so just load them up front, also more convienent.
  (setq evil-ex-search-vim-style-regexp t
	;; Vim compat
	evil-ex-visual-char-range t
	evil-symbol-word-search t
	evil-want-C-u-scroll t
	;; Y behaves like y$
	evil-want-Y-yank-to-eol t
	evil-respect-visual-line-mode t
	;; Only show highlights in current window
	evil-ex-interactive-search-highlight 'selected-window
	;; Needed for evil-collection
	evil-want-keybinding nil
	;; Don't abort my macros for dumb errors
	evil-kbd-macro-suppress-motion-error t
	evil-undo-system 'undo-redo)
  :config
  ;; Set default states for some buffers
  (evil-set-initial-state 'pdf-view-mode 'normal)
  ;; Don't automatically copy visual selection to clipboard
  (setq evil-visual-update-x-selection-p nil)
  ;; Needed for gn to work
  (evil-select-search-module 'evil-search-module 'evil-search)
  ;; Super-tab behavior
  ;; 1) if we are inside a snippet, jump to the next field,
  ;; 2) if we are inside a org table, jumpt to the next field
  ;; 3) try to expand the snippet 
  ;; 4) fall back to `indent-for-tab-command'
  ;; TODO: Order is not good, should probably expand snippets or jump,
  ;; then org jump and then indent or complete.
  (defun smarttab ()
    (interactive)
    (cond ((bound-and-true-p tempel--active) (tempel-next 1))
	  ((and (fboundp #'org-at-table-p) (org-at-table-p)) (org-table-next-field))
	  (t (if (not (tempel-expand))
		 (indent-for-tab-command)))))
  ;; If in a snippet, jump back, otherwise 
  (defun smartshifttab ()
    (interactive)
    (cond ((bound-and-true-p tempel--active) (tempel-previous 1))
	  ((and (fboundp #'org-at-table-p) (org-at-table-p)) (org-table-previous-field))
	   (t ())))
  ;; Extra insert mode bindings
  (general-def 'insert
    ;; Enter normal mode by entering jk while in insert mode
    "j" (general-key-dispatch 'self-insert-command :timeout 0.25 "k" #'evil-normal-state)
    ;; Paste in insert mode via Ctrl-Shift-v
    "C-V" #'evil-paste-before
    ;; Overloaded tabbing
    "<tab>"     #'smarttab
    "<backtab>" #'smartshifttab)
    ;; Continue comments
  (general-def 'global-map
    "RET"       #'default-indent-new-line)
  ;; Extra normal mode bindings
  (general-def 'normal
    "]t" #'tab-next
    "[t" #'tab-previous)
  ;; Move windows via C-hjkl, help is rebounded via <leader>h so it is fine to
  ;; remap C-h (I think)
  (general-def 'normal 'override
    "C-h" #'windmove-left
    "C-j" #'windmove-down
    "C-k" #'windmove-up
    "C-l" #'windmove-right)
  ;; TODO: this breaks some stuff, so uncomment for now
  ;; Make J (evil-join) remove comment delimiters when joining lines.
  ;; This was taken from https://github.com/emacs-evil/evil/issues/606
  ;; (evil-define-operator better-evil-join (beg end)
  ;;   "Join the selected lines."
  ;;   :motion evil-line
  ;;   (let* ((count (count-lines beg end))
  ;; 	   ;; we join pairs at a time
  ;; 	   (count (if (> count 1) (1- count) count))
  ;; 	   ;; the mark at the middle of the joined pair of lines
  ;; 	   (fixup-mark (make-marker)))
  ;;     (dotimes (var count)
  ;; 	(if (and (bolp) (eolp))
  ;; 	    (join-line 1)
  ;; 	  (let* ((end (line-beginning-position 3))
  ;; 		 (fill-column (1+ (- end beg))))
  ;; 	    ;; save the mark at the middle of the pair
  ;; 	    (set-marker fixup-mark (line-end-position))
  ;; 	    ;; join it via fill
  ;; 	    (fill-region-as-paragraph beg end)
  ;; 	    ;; jump back to the middle
  ;; 	    (goto-char fixup-mark)
  ;; 	    ;; context-dependent whitespace fixup
  ;; 	    (fixup-whitespace))))
  ;;     ;; remove the mark
  ;;     (set-marker fixup-mark nil)))
  ;; (advice-add #'evil-join :override #'better-evil-join)
  ;; Core leader bindings
  (leader-keys
    "<tab>" '("find tabs" . tab-bar-select-tab-by-name)
    "SPC"   '("alt buffer" . evil-switch-to-windows-last-buffer)
    "f"     '("files" . find-file)
    "xb"     '("kill buffer" . kill-current-buffer)
    "xt"     '("kill tab" . tab-close)
    "pa"    '("project alternate" . ff-find-other-file)
    "hm"    '("help mode" . describe-mode)
    "hv"    '("help variable" . describe-variable)
    "ht"    '("help function" . describe-face)
    "hf"    '("help function" . describe-function)
    "hk"    '("help key" . describe-key)))
;;;
;;; Modules for extending evil
;;;
;;; Commenting via gcc
(use-package evil-commentary
  :ensure t
  :after evil
  :hook (on-first-input . evil-commentary-mode))
;;;
;;; Surrounding via ys (normal mode) and S (visual mode)
(use-package evil-surround
  :ensure t
  :after evil
  :hook (on-first-input . global-evil-surround-mode))
;;;
;;; Large collection of evil compat modules
(use-package evil-collection
  :ensure t
  :after evil
  :hook (evil-mode . evil-collection-init))
;;;
;;; Allow incrementing via C-a and C-x, use g before for incremental
(use-package evil-numbers
  :ensure t
  :after evil
  :general
  (general-def '(normal visual)
   "C-a"   #'evil-numbers/inc-at-pt
   "C-x"   #'evil-numbers/dec-at-pt
   "g C-a" #'evil-numbers/inc-at-pt-incremental
   "g C-x" #'evil-numbers/dec-at-pt-incremental))
;;;
;;; Allows using * and # on visual selections to search
(use-package evil-visualstar
  :ensure t
  :hook (on-first-input . global-evil-visualstar-mode))
;;;
;;; Indentation text objects
(use-package evil-indent-plus
  :ensure t
  :hook (on-first-input . evil-indent-plus-default-bindings))
;;;
;;; Block textobjs and seeking
(use-package evil-textobj-anyblock
  :ensure t
  :after evil
  :general
  (:keymaps 'inner "b" #'evil-textobj-anyblock-inner-block)
  (:keymaps 'outer "b" #'evil-textobj-anyblock-a-block)
  :init
  (setq evil-textobj-anyblock-blocks
        '(("(" . ")")
          ("{" . "}")
          ("\\[" . "\\]")
          ("<" . ">")
	  ("'" . "'")
	  ("\"" . "\"")
	  ("`" . "`")
	  ("“" . "”"))))
;;;
;;; Matchit
(use-package evil-matchit
  :ensure t
  :hook (on-first-input . global-evil-matchit-mode))
;;;
;;; Modeline for evil
(use-package doom-modeline
  :ensure t
  :hook (emacs-startup . doom-modeline-mode)
  :init
  ;; Set these early
  (setq doom-modeline-always-show-macro-register t
	doom-modeline-height 40
	doom-modeline-modal-modern-icon nil
	doom-modeline-battery nil
	doom-modeline-irc nil
	doom-modeline-time nil)
  :config
  ;; Simpler modeline for sidebar
  (doom-modeline-def-modeline 'sidebar '(bar buffer-info-simple) '()))
;;;
;;; Anzu, shows search results. This is used for evil-anzu which is
;;; needed by doom-modeline to show results. I don't think isearach
;;; counts work.
(use-package anzu :ensure t)
(use-package evil-anzu
  :ensure t
  :hook (on-first-input . (lambda ()
			(global-anzu-mode +1)
			(require 'evil-anzu))))
;;;
;;
;; |* Editor
;;
;;; Important packages for editing, this is the usual stack:
;;; consult, corfu, marginalia, vertico, embark, and orderless
;;;
;;; Provides lots of goodies for searching and jumping
(use-package consult
  :ensure t
  :general
  (leader-keys
    "/" '("search" . consult-line)
    "g" '("grep" . consult-ripgrep)
    "b" '("buffer" . consult-buffer)))
;;;
;;; Verical completion buffer in the mini-buffer
(use-package vertico
  :ensure t
  :hook (on-first-input . vertico-mode)
  :config
  (setq vertico-count 15
	vertico-resize nil)
  (general-def 'vertico-map
    "C-SPC" #'+vertico/embark-preview
    "C-M-n" #'vertico-next-group
    "C-M-p" #'vertico-previous-group))
;;;
;;; Provides annotation (tid bits of information) on the sides for vertico
(use-package marginalia
  :ensure t
  :hook (on-first-input . marginalia-mode))
;;;
;;; embark, basically a context menu activated using keybindings
(use-package embark
  :ensure t
  :general
  (general-def minibuffer-local-map
    "C-;"      #'embark-act
    "C-c C-;"  #'embark-export
    "C-c C-l"  #'embark-collect)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
	       '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
		 nil
		 (window-parameters (mode-line-format . none)))))
;;;
;;; embark integration with consult
(use-package embark-consult
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))
;;;
;;; Super duper cool package which makes searching much nice.
;;; Separate components by spaces and use those to match candidates in
;;; any order! Orderless
;;;
;;; TODO: orderless-flex for fuzzy searching?
(use-package orderless
  :ensure t
  :hook (on-first-input . (lambda()
			    (setq completion-styles '(orderless basic))
			    (setq completion-category-overrides '((file (styles basic partial-completion)))))))
;;;
;;; Completion
(use-package corfu
  :ensure t
  :hook (on-first-input . global-corfu-mode)
  :config
  (setq corfu-preview-current 'insert
	corfu-popupinfo-mode t
	corfu-auto t
	corfu-auto-delay 0.25
	corfu-auto-prefix 2
	corfu-cycle nil
	corfu-preselect-first t
	completion-cycle-threshold nil))
;;;
;;; Fun icons for corfu
(use-package nerd-icons-corfu
  :ensure t
  :hook (global-corfu-mode . (lambda () (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))))
;;;
;;; Completion extensions for corfu
(use-package cape
  :ensure t
  :hook
  ((prog-mode text-mode). (lambda ()
			 (add-to-list 'completion-at-point-functions #'cape-dabbrev)
			 (add-to-list 'completion-at-point-functions #'cape-file))))
;;;
;;; Jumping around with avy
;;; TODO: check out if `avy-goto-char-timer` is better, it is more flexible
(use-package avy
  :ensure t
  :after evil
  :general
  (leader-keys "s" '("search (avy)" . avy-goto-char-2))
  :config
  (setq avy-background t))
;;;
;;; Slick search and replace
(use-package wgrep
  :ensure t
  :commands wgrep-change-to-wgrep-mode
  :config
  (setq wgrep-auto-save-buffer t))
;;;
;;
;; |* Dev
;;
;;; magit ... .... .....
(use-package magit
  :ensure t
  :general
  (leader-keys
    "mm" '("magit status" . magit-status)
    "ml" '("magit log" . magit-log-current)
    "ma" '("magit annotate" . vc-annotate)
    "md" '("magit diff" . magit-diff-buffer-file))
  :config
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))
;;;
;;; VC-gutter! Show diffs in the fringes or margins
(use-package diff-hl
  :ensure t
  :hook (on-first-file . global-diff-hl-mode)
  :config
  ;; Already started on-first-file so no need to load on keybinds
  (general-def 'normal
    "gh" #'diff-hl-stage-current-hunk
    "gH" #'diff-hl-revert-hunk
    "]h" #'diff-hl-next-hunk
    "[h" #'diff-hl-previous-hunk)
  ;; Move fringes outside of margin and set margin to 1, since I am not using
  ;; line numbers I have to manually add this to create some room between the
  ;; fringe and the text.
  (setq-default fringes-outside-margins t
		left-margin-width '1)
  ;; Slightly simpler implementation of Doom's vc-gutter
  ;; Create a bit map for the fringe, where the left half is a solid bar. This
  ;; creates the bits 11110000 if width is eight or 1100 if width is four.
  ;; Fairly simple implementation, alternative can be factorial and left shift.
  (let* ((width 8)
	 (bitmap (vector (string-to-number (concat
					    (make-string (/ width 2) ?1)
					    (make-string (/ width 2) ?0)) 2))))
    ;; We use periodic '(top t) to repeat the bits instead of doing it manually
    (define-fringe-bitmap 'diff-hl-pretty-line bitmap 1 width '(top t)))
  ;; Creates a small triangle pointing to the right, used for deleted lines
  (let* ((width 8)
	 (bitmap (vector
		 #b11000000
		 #b11100000
		 #b11110000
		 #b11111000
		 #b11111100
		 #b11111000
		 #b11110000
		 #b11100000
		 #b11000000)))
    (define-fringe-bitmap 'diff-hl-pretty-delete bitmap 9 width))
  ;; Set our custom gutters
  (defun vc-gutter (type _pos)
    (if (eq type 'delete) #'diff-hl-pretty-delete #'diff-hl-pretty-line))
  (setq diff-hl-fringe-bmp-function #'vc-gutter)
  ;; Use fringes, I am not sure why 
  (diff-hl-margin-mode -1)
  ;; Nice defaults
  (setq diff-hl-side 'left
	diff-hl-global-modes '(not image-mode pdf-view-mode)
	;; Nicer and faster diffs
	vc-git-diff-switches '("--histogram")
	;; Don't block while updating
	diff-hl-update-async t
	;; updating diffs while staging and unstaging hunks
	diff-hl-show-staged-changes nil))
;;;
;;; Superbuffed dired
(use-package dirvish
  :ensure t
  :general
  (leader-keys "os" '("open sidebar" . dirvish-side))
  (leader-keys "of" '("open file manager" . dirvish))
  :general-config
  ;; Keybinds, most are from Doom
  (general-def 'normal 'dirvish-mode-map
    "?"   #'dirvish-dispatch
    "h"   #'dired-up-directory
    "l"   #'dired-find-file
    "<tab>" #'dirvish-subtree-toggle
    "<backtab>" #'dirvish-subtree-up
    "S"   #'dirvish-quicksort
    "F"   #'dirvish-layout-toggle
    "z"   #'dirvish-history-jump
    "p"   #'dirvish-yank)
  (general-def 'normal 'dirvish-mode-map :prefix "y"
    "l"   #'dirvish-copy-file-true-path
    "n"   #'dirvish-copy-file-name
    "p"   #'dirvish-copy-file-path
    "r"   #'dirvish-copy-remote-path
    "y"   #'dired-do-copy)
  :config
  (dirvish-override-dired-mode)
  (setq dirvish-reuse-session 'open)
  (setq dirvish-subtree-always-show-state t)
  (setq dirvish-side-width 27)

  ;; kanagawa (upstream ?) 
  (set-face-attribute 'dirvish-inactive nil :inherit 'mode-line-inactive)
  (set-face-attribute 'dirvish-hl-line nil :inherit 'hl-line)
  (set-face-attribute 'dirvish-hl-line-inactive nil :inherit 'hl-line)

  (defface dirvish-file-size '((t :inherit 'font-lock-comment-face)) "Dirvish")
  (defface dirvish-subtree-guide '((t :inherit 'font-lock-comment-face)) "Dirvish")
  (defface dirvish-subtree-state '((t :inherit 'font-lock-comment-face)) "Dirvish")

  ;; prettier
  (setq dirvish-nerd-icons-height 0.8
        dirvish-subtree-prefix "  ")
  (setq dirvish-hide-details '(dirvish dirvish-side)
	dirvish-hide-cursor '(dirvish dirvish-side))
  (setq dirvish-subtree-state-style 'nerd)
  (setq dirvish-attributes '(file-size nerd-icons subtree-state vc-state)
	dirvish-mode-line-format
	'(:left (sort file-time symlink) :right (omit yank index)))
  ;; Not sure why by -11 gives perfect height
  (when-let (height (- (bound-and-true-p doom-modeline-height) 11))
    (setq dirvish-mode-line-height height)
    (setq dirvish-header-line-height height))

  ;; Allow focusing the side normally
  (setq dirvish-side-window-parameters
	'((no-other-window . nil)
	  (no-delete-other-windows . t))))
;;;
;;; Colorful dired
(use-package diredfl
  :ensure t
  :hook (dired-mode . diredfl-mode)
  :hook (dirvish-directory-view-mode . diredfl-mode))
;;;
;;; Delicious terminal emulation
(use-package eat
  :ensure t
  :general
  (leader-keys
    "ot" '("open terminal" . eat)
    "pt" '("project terminal" . eat-project))
  :config
  ;; Restore <tab> autocompletion for eat
  (general-def 'insert 'eat-mode-map
   "<tab>" #'eat-self-input
   "<backtab>" #'eat-self-input))
;;;
;;; Containerized development
(use-package docker
    :ensure t
    :commands docker
    :config
    (setq docker-command "podman"
	  docker-compose-command "podman-compose"
	  docker-container-tramp-method "podman"))
;;;
;;; Snippets vial tempel, this can be used standalone or inside aas snippets for
;;; more functionality like prompts and fields which aas does not provide out of
;;; the box.
(use-package tempel
  :ensure t
  :commands (tempel-expand tempel-insert tempel-complete)
  :config
  ;; Sets up a repeat custom element for use in snippets, taken from the example
  ;; on tempel's repository. This is great for matrices and tables.
  (defun tempel-repeat (elt fields)
    (pcase elt
      (`(* ,count . ,rest)
       (cons 'l (cl-loop for i below (eval count fields) append rest)))))
  (add-to-list 'tempel-user-elements #'tempel-repeat)
  ;; Integrate snippets with completion
  (defun tempel-setup-capf ()
    (add-hook 'completion-at-point-functions #'tempel-expand -1 'local))
  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf))
;;;
;;
;; |* Languages
;;
;;; Powered by treesitter as much as possible.
(use-package treesit
  :ensure nil
  :mode
  (("\\.css\\'"    . css-ts-mode)
   ("\\.lua\\'"    . lua-ts-mode)
   ("\\.html\\'"   . html-ts-mode)
   ("\\.toml\\'"   . toml-ts-mode)
   ("\\.java\\'"   . java-ts-mode)
   ("\\.json5?\\'" . json-ts-mode)
   ("\\.ya?ml\\'"  . yaml-ts-mode)
   ("\\.py\\'"     . python-ts-mode)
   ("\\.c\\'"      . c-ts-mode)
   ("\\.h\\'"      . c-or-c++-ts-mode)
   ("\\.cpp\\'"    . c++-ts-mode)
   ("\\.js\\'"     . js-ts-mode)
   ("\\([tj]sx\\)\\'" . tsx-ts-mode)
   ;; I am not sure how to make this all merged... probably some regex
   ("\\.cmake\\'" . cmake-ts-mode)
   ("\\CMakeLists.txt\\'" . cmake-ts-mode)
   ("\\Dockerfile\\'" . dockerfile-ts-mode)
   ("\\Containerfile\\'" . dockerfile-ts-mode))
  :interpreter ("bash" . bash-ts-mode)
  :preface
  ;; Sets font lock for more colorful code and add default recipes for
  ;; installing grammar.
  ;; TODO: treesit-auto? Honestly wish that was builtin...
  ;; TODO: pin releases
  (setq treesit-font-lock-level 4
	treesit-language-source-alist
	'((c "https://github.com/tree-sitter/tree-sitter-c.git")
	  (cpp "https://github.com/tree-sitter/tree-sitter-cpp.git")
	  (javascript "https://github.com/tree-sitter/tree-sitter-javascript.git")
	  (json "https://github.com/tree-sitter/tree-sitter-json.git")
	  (css "https://github.com/tree-sitter/tree-sitter-css.git")
	  (html "https://github.com/tree-sitter/tree-sitter-html.git")
	  (dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile.git")
	  (cmake "https://github.com/uyha/tree-sitter-cmake.git")
	  (rust "https://github.com/tree-sitter/tree-sitter-rust.git")
	  (python "https://github.com/tree-sitter/tree-sitter-python.git")
	  (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.20.3" "tsx/src"))
	  (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.20.3" "typescript/src"))
	  (bash "https://github.com/tree-sitter/tree-sitter-bash.git")
	  (lua "https://github.com/MunifTanjim/tree-sitter-lua.git")
	  (java "https://github.com/tree-sitter/tree-sitter-java.git")
	  (toml "https://github.com/ikatyang/tree-sitter-toml.git")
	  (yaml "https://github.com/ikatyang/tree-sitter-yaml.git")))
  ;; Do some remaps for built-in modes
  (dolist (mapping
	   '((python-mode . python-ts-mode)
	     (css-mode . css-ts-mode)
	     (typescript-mode . typescript-ts-mode)
	     (js-mode . js-ts-mode)
	     (bash-mode . bash-ts-mode)
	     (conf-toml-mode . toml-ts-mode)
	     (json-mode . json-ts-mode)
	     (typescript-mode . typescript-ts-mode)
	     (js-json-mode . json-ts-mode)
	     (c-mode . c-ts-mode)
	     (c++-mode . c++-ts-mode)
	     (c-or-c++-mode . c-or-c++-ts-mode)))
    (add-to-list 'major-mode-remap-alist mapping)))
;;
;; I hate C
(use-package c-ts-mode
  :ensure nil
  :general-config
  (localleader-keys 'c-ts-mode-map
    "o" '("other file" . find-sibling-file))
  :config
  (add-to-list 'find-sibling-rules '("/\\([^/]+\\)\\.c\\(c\\|pp\\)?\\'" "\\1.h\\(h\\|pp\\)?\\'"))
  (add-to-list 'find-sibling-rules '("/\\([^/]+\\)\\.h\\(h\\|pp\\)?\\'" "\\1.c\\(c\\|pp\\)?\\'"))
  (setq c-default-style "linux"
        c-ts-mode-indent-style 'linux
	c-ts-mode-indent-offset 8)
  ;; HACK: for some reason ts indent is broken in c, apparantly fixed in emacs 31
  ;; this breaks indentation style a little, but it should suffice for now
  (general-def 'insert 'c-ts-mode-map
    "RET" 'evil-ret-and-indent))
;;;
;;; For when I need markdown
(use-package markdown-mode
  :mode "\\.md\\'"
  :ensure t
  :config
  (setq markdown-make-gfm-checkboxes-buttons t
        markdown-fontify-whole-heading-line t
        markdown-fontify-code-blocks-natively t
	markdown-enable-math t
	markdown-open-command "xdg-open"
	markdown-mouse-follow-link nil))
;;;
;;; Use rust-mode with treesitter integration 
;;; TODO: restic-mode ?
(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :config
  (setq rust-mode-treesitter-derive t))
;;;
;;; TODO: Move to nix-ts-mode evenutally
(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'")
;;;
;;; Rare times where I have to work with jupyter notebooks
;;; https://github.com/astoff/code-cells.el
(use-package code-cells
  :ensure t
  :mode ("\\.ipynb\\'" . code-cells-mode))
;;;
;;; Beancount, for counting beans...
(use-package beancount
  :mode ("\\.bean\\'" . beancount-mode)
  :hook ((beancount-mode . outline-minor-mode)
	 (beancount-mode . flymake-bean-check-enable)))
;;;
;;
;; |* Org
;;
;;; TODO: org-modern, it takes a while to get it looking good: font choice, color, etc
;;;
;;; Magical unicorn
(use-package org
  :ensure nil
  :defer-incrementally
  calendar find-func format-spec org-macs org-compat org-faces org-entities
  org-list org-pcomplete org-src org-footnote org-macro ob org org-agenda
  org-capture
  :general
  (leader-keys
    "na" '("org agenda" . org-agenda)
    "nn" '("org capture" . org-capture))
  :preface
  ;; Reduces first load delay, I don't think I need any of these actually,
  ;; well maybe bibtex in the future
  (defvar org-modules
    '(;; ol-w3m
      ;; ol-bbdb
      ol-bibtex
      ;; ol-docview
      ;; ol-gnus
      ;; ol-info
      ;; ol-irc
      ;; ol-mhe
      ;; ol-rmail
      ;; ol-eww
      ))
  :init
  (defun org-init ()
    ;; Set some nice settings
    (setq org-auto-align-tags nil
	  ;; put tags after the heading, complements with no tag alignment
	  org-tags-column 0
	  ;; catch and show errors
	  org-catch-invisible-edits 'show-and-error
	  org-insert-heading-respect-content t
	  ;; prettify
	  org-hide-emphasis-markers t
	  org-pretty-entities t
	  ;; ditto for agenda
	  org-agenda-tags-column 0
	  ;; show diary entries (birthdays, anniversities) in agenda
	  org-agenda-include-diary t)
    ;; Create some org files,
    ;;   inbox.org is where captured notes go
    ;;   todo.org is where notes from inbox.org gets filed to
    ;;   agenda.org is where reoccuring tasks or tasks with a time interval go
    ;; So captured -> inbox.org -> todo.org
    (setq org-directory "~/org/"
          org-agenda-files '("agenda.org" "inbox.org" "todo.org"))
    ;; Refiling
    ;; Everything expect for meetings gets forwarded to my inbox where I refile
    ;; them later, usually at the end of the day
    (setq org-capture-templates
	  `(("t" "todo" entry (file "inbox.org")
	     "* TODO %?\n%U")
	    ("q" "quick" entry (file "inbox.org")
	     "* NEXT %?\n%U")
	    ("n" "note" entry (file "inbox.org")
	     "* %? :note:\n%U\n%a")
	    ("m" "meeting" entry (file+headline "agenda.org" "Future")
	     "* %?\n<%<%Y-%m-%d %H:00>>")))
    ;; Refiling
    (setq org-refile-targets '(("todo.org" :maxlevel . 1)))
    (setq org-refile-use-outline-path 'file)
    (setq org-outline-path-complete-in-steps nil)
    ;; Todo state
    (setq org-todo-keywords
	  '((sequence "TODO(t)" "NEXT(n)" "HOLD(h)" "|" "DONE(d)")))
    ;; Agenda customizations
    ;; Remove separator horizontal lines
    (setq org-agenda-block-separator nil)
    ;; Log DONE tags with :CLOSED [time]
    (setq org-log-done 'time)
    ;; Custom version of `n' where NEXT, TODO, and DONE are separated
    (setq org-agenda-custom-commands
	  '(("n" "my agenda"
	     ((agenda ""
		      ((org-agenda-span 'day)
		       (org-agenda-time-grid '((daily) (800 1000 1200 1400 1600 1800 2000) "......" "---------------"))
		       (org-agenda-current-time-string "--- < now > ---")))
	      (todo "NEXT"
		    ((org-agenda-prefix-format "  %i %-12:c[%e] ")
		     (org-agenda-overriding-header "\nNext")))
	      (todo "TODO"
			 ((org-agenda-prefix-format "  %i %-12:c%?-12t% s")
			  (org-agenda-overriding-header "\nTodo")))
	      (tags "CLOSED>=\"<today>\""
		    ((org-agenda-prefix-format "  %i %?-12t% s")
		     (org-agenda-overriding-header "\nDone"))))))))
  (add-hook 'org-load-hook #'org-init)
  :config
  ;; Auto save after refiling
  (advice-add 'org-refile :after
        (lambda (&rest _)
          (org-save-all-org-buffers)))
  (general-def 'normal 'org-mode-map "RET" #'org-open-at-point)
  (localleader-keys 'org-mode-map
		    "r" '("org-mode refile" . org-refile)
		    "t" '("org-mode tag" . org-set-tags-command)
		    "e" '("org-mode effort" . org-set-effort)))
;;;
;;; org-roam, progenitor of all madness
(use-package org-roam
  :ensure t
  :general
  (leader-keys "nm" '("notes mind" . org-roam-node-find))
  :general-config
  ;; make sure these do not conflict with the ones above
  (localleader-keys 'org-mode-map
    "f" '("roam find" . #'org-roam-node-find)
    "F" '("roam find ref" . #'org-roam-ref-find)
    "i" '("roam insert" . #'org-roam-node-insert)
    "I" '("roam id create" . #'org-id-get-create)
    "b" '("roam backlinks" . #'org-roam-buffer-toggle)
    "R" '("roam refile" . #'org-roam-refile))
  :config
  ;; From https://jmthornton.net/blog/p/org-roam-created-modified-dates
  ;; Adds created and modified to properties automatically. Using this instead of org-roam-timestamps
  ;; because that one does it for all nodes which is too much for me, I just need it for files
  (defun org-roam-extract-timestamp-from-filepath (filepath)
    "Extract timestamp from the Org-roam FILEPATH assuming it follows the default naming scheme."
    (let ((filename (file-name-nondirectory filepath)))
      (when (string-match "\\([0-9]\\{12\\}\\)" filename) (match-string 1 filename))))

  (defun org-roam-insert-created-property ()
    "Insert :created: property for an Org-roam node.

     Does not override the property if it already exists.

     Calculation of the creation date is based on the filename of the note,
     and assumes the default Org-roam naming scheme."
    (interactive)
    (when (org-roam-file-p)
      ;; Don't update if the created property already exists
      (unless (org-entry-get (point-min) "date" t)
	(let ((creation-time (org-roam-extract-timestamp-from-filepath
                              (buffer-file-name))))
          ;; Don't error if the filename doesn't contain a timestamp
          (when creation-time
            (save-excursion
              ;; Ensure point is at the beginning of the buffer
              (goto-char (point-min))
              (org-set-property "date" creation-time)))))))

  (defun org-roam-insert-modified-property ()
    "Update the :modified: property for an Org-roam node upon saving."
    (when (org-roam-file-p)
      (save-excursion
	;; Ensure property is applied to the whole file
	(goto-char (point-min))
	(org-set-property
	 "updated" (format-time-string "%Y%m%d%H%M")))))
  (add-hook 'before-save-hook #'org-roam-insert-created-property)
  (add-hook 'before-save-hook #'org-roam-insert-modified-property)
  
  (setq org-roam-directory "~/org/roam"
	rg-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; https://zettelkasten.de/posts/concepts-sohnke-ahrens-explained/
  ;; default is going to be the main notes I have, these are the Permanent Notes
  ;; fleeting is when I am quickly capturing something down and need to refine later
  ;;   and is equivalent to Fleeting Notes (I am more likely to jot them in my notebook though)
  ;; literature is for capturing references temporarily and then moving it to something like zotero
  ;;   this is the equivalent to Literature Notes
  ;; index is structural notes, kind of like a ToC or MoC and serves as a hub for notes
  ;; Project Notes I do not really have a need, but is probably best served with a physical notebook 
  ;;
  ;; Hubs serves as "topic tags" essentially. I can thus reserve tags for describing the note
  ;; itself (tags as topics gets too large and messy). For example, I have the usual
  ;;    fleeting, literature, index
  ;; which is the the type of note itself, but I also have
  ;;    question, theory, implementation, definition
  ;; for how the note is used
  ;; TODO: maybe use observation, assumption, code, reference?
  (setq org-roam-capture-templates
	'(("d" "default" plain "%?"
	   :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
	   :unnarrowed t)
	  ("f" "fleeting note" plain "%?"
	   :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: fleeting")
	   :unnarrowed t)
	  ("l" "literature note" plain "%?"
	   :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: literature")
	   :unnarrowed t)
	  ("i" "index note" plain "%?"
	   :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: index")
	   :unnarrowed t))))
;;;
;;; org-roam-ui, the best ui for org and roaming about
(use-package websocket
  :ensure t
  :after org-roam)
(use-package org-roam-ui
  :ensure t
  :after org-roam
  :commands (org-roam-ui-open)
  :config
  (setq org-roam-ui-sync-theme t
	org-roam-ui-follow t
	org-roam-ui-update-on-save t
	org-roam-ui-open-on-start t))
;;;
;;; Evil unicorn
(use-package evil-org
  :ensure t
  :hook ((org-mode . evil-org-mode)
	 (org-agenda-mode . evil-org-mode))
  :config
  (evil-org-set-key-theme)
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
;;;
;;
;; |* Latex
;;
;;; Moderately fast latex typesetting configuration. This relies on auctex per
;;; usual along with pdf-tools for viewing and latexmk for compiling documents
;;;
;;; But we have some cool tricks using aas (and laas) for automatically
;;; inserting snippets without pressing tab. As usual, inspired by this gem:
;;; https://castel.dev/post/lecture-notes-1/
;;;
;;; Pretty symbols and general LaTeX-mode. I hated configuring this...
(use-package auctex
  :ensure t
  :mode ("\\.tex\\'" . latex-mode)
  :config
    (setq preview-protect-point t)
  (setq preview-locating-previews-message nil)
  (setq preview-leave-open-previews-visible t)
  (setq TeX-parse-self t
	TeX-auto-save t
	;; Cleaner dir
	TeX-auto-local ".auctex-auto"
	TeX-style-local ".auctex-style"
	;; Better correlate behavior
	TeX-source-correlate-mode t
	TeX-source-correlate-method 'synctex
	TeX-source-correlate-start-server nil
	;; Don't ask
	TeX-save-query nil
	;; I also use the same one so don't prompt
	TeX-master "main.tex"
	;; from Doom, better scaling for previews
	preview-scale 1.4
	preview-scale-function (lambda () (* (/ 10.0 (preview-document-pt)) preview-scale))
	;; Don't cache preamble
	preview-auto-cache-preamble nil
	;; View using pdf tools
	TeX-view-program-selection '((output-pdf "PDF Tools")))
  (add-hook 'LaTeX-mode-hook #'prettify-symbols-mode)
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
  ;; This huge function makes proper and really pleasing indentations for
  ;; item-like environments. This was taken from:
  ;; https://emacs.stackexchange.com/questions/3083/how-to-indent-items-in-latex-auctex-itemize-environments?noredirect=1
  (setq LaTeX-indent-level-item-continuation 8)
  (defun LaTeX-indent-item ()
    "Provide proper indentation for LaTeX \"itemize\",\"enumerate\", and
    \"description\" environments.

    \"\\item\" is indented `LaTeX-indent-level' spaces relative to
    the the beginning of the environment.

    Continuation lines are indented either twice
    `LaTeX-indent-level', or `LaTeX-indent-level-item-continuation'
    if the latter is bound."
    (save-match-data
      (let* ((offset LaTeX-indent-level)
	     (contin (or (and (boundp 'LaTeX-indent-level-item-continuation)
			      LaTeX-indent-level-item-continuation)
			 (* 2 LaTeX-indent-level)))
	     (re-beg "\\\\begin{")
	     (re-end "\\\\end{")
	     (re-env "\\(itemize\\|\\enumerate\\|description\\)")
	     (indent (save-excursion
		       (when (looking-at (concat re-beg re-env "}"))
			 (end-of-line))
		       (LaTeX-find-matching-begin)
		       (current-column))))
	(cond ((looking-at (concat re-beg re-env "}"))
	       (or (save-excursion
		     (beginning-of-line)
		     (ignore-errors
		       (LaTeX-find-matching-begin)
		       (+ (current-column)
			  (if (looking-at (concat re-beg re-env "}"))
			      contin
			    offset))))
		   indent))
	      ((looking-at (concat re-end re-env "}"))
	       indent)
	      ((looking-at "\\\\item")
	       (+ offset indent))
	      (t
	       (+ contin indent))))))
  (setq LaTeX-indent-environment-list
	(nconc '(("itemize" LaTeX-indent-item)
		 ("enumerate" LaTeX-indent-item)
	       LaTeX-indent-environment-list)))
  ;; From https://karthinks.com/software/latex-input-for-impatient-scholars/
  (defun latex-math-from-calc ()
    "Evaluate `calc' on the contents of line at point."
    (interactive)
    (cond ((region-active-p)
	   (let* ((beg (region-beginning))
		  (end (region-end))
		  (string (buffer-substring-no-properties beg end)))
	     (kill-region beg end)
	     (insert (calc-eval `(,string calc-language latex
					  calc-prefer-frac t
					  calc-angle-mode rad)))))
	  (t (let ((l (thing-at-point 'line)))
	       (end-of-line 1) (kill-line 0)
	       (insert (calc-eval `(,l
				    calc-language latex
				    calc-prefer-frac t
				    calc-angle-mode rad)))))))
  ;; Compile using latexmk
  (defun compile-latex ()
    (interactive)
    (TeX-save-document (TeX-master-file))
    (TeX-command "LaTeXMk" 'TeX-master-file -1))
  ;; Run my inkfig script using the symbol at point as the name  
  ;; Use start process to avoid creating a buffer
  (defun inkfig ()
    (interactive)
    (start-process "inkfig " nil "inkfig" (format "%s/figures/%s.svg"
						  (buffer-local-value 'default-directory (current-buffer))
						  (symbol-at-point))))
  (localleader-keys 'LaTeX-mode-map
    "e" '("latex evaluate" . latex-math-from-calc)
    "p" '("latex preview" . preview-at-point)
    "P" '("latex unPreview" . preview-clearout-at-point)
    "f" '("latex figures" . inkfig)
    "a" '("latex auto-compile" . auctex-cont-latexmk-toggle)
    "c" '("latex compile" . compile-latex)
    "v" '("latex view" . TeX-view)))
;;;
;;; Viewing pdfs and more
(use-package pdf-tools
  :ensure t
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install)
  ;; Follow theme
  (add-hook 'pdf-view-mode-hook 'pdf-view-themed-minor-mode)
  ;; Fixes flickering of cursor due to evil, and also gets rid of the 
  ;; pesky one pixel border frame on the pdf view as well
  (add-hook 'pdf-view-mode-hook
	    (lambda ()
	      (set (make-local-variable 'evil-normal-state-cursor) (list nil)))))
;;;
;;; Automagically compile tex files. Enable via `auctex-cont-latexmk-mode'
(use-package auctex-cont-latexmk
  :ensure t
  :commands (auctex-cont-latexmk-toggle))
;;;
;;; Automagically expand snippets without pressing <tab> or entering a space
(use-package aas
  :ensure t
  :hook ((LaTeX-mode . aas-activate-for-major-mode)
	 (org-mode . aas-activate-for-major-mode)))
;;;
;;; A collection of common snippets for use with aas
(use-package laas
  :ensure t
  :hook ((LaTeX-mode . laas-mode)
	 (org-mode . laas-mode)
	 (markdown-mode . laas-mode))
  :config
  ;; Do not add space after auto expanding snippets, main use case is so I can
  ;; directly wrap the expanded term into a fraction if I wanted to without
  ;; backspacing first.
  (setq laas-enable-auto-space nil)
  ;; Taken from https://github.com/karthink/lazytab
  ;; Credits to karthink and their excellent post:
  ;; https://karthinks.com/software/latex-input-for-impatient-scholars/
  ;;
  ;; Basically allows one to make table environments using org tables,
  ;; then convert to latex tables via C-c C-c once done
  ;;
  ;; Main caveat is you can't turn it back into an org table.
  (defun my/orgtbl-replace (_)
    (interactive "P")
    (unless (org-at-table-p) (user-error "Not at a table"))
    (let* ((table (org-table-to-lisp))
	   (params '(:backend latex :raw t))
	   (replacement-table (orgtbl-to-latex table params)))
      (kill-region (org-table-begin) (org-table-end))
      (open-line 1)
      (push-mark)
      (insert replacement-table)
      (align-regexp (region-beginning) (region-end) "\\([:space:]*\\)& ")
      (indent-region (region-beginning) (region-end))
      (orgtbl-mode -1)
      (advice-remove 'orgtbl-ctrl-c-ctrl-c #'my/orgtbl-replace)))
  (defun my/latex-orgtb ()
    (require 'org-table)
    (advice-add 'orgtbl-ctrl-c-ctrl-c :after #'my/orgtbl-replace)
    (orgtbl-mode 1)
    (insert "|"))
  ;; From https://github.com/tecosaur/LaTeX-auto-activating-snippets/issues/25
  ;; Allows using laas in markdown math environments as well
  (defun laas-mathp ()
    "Determine whether point is within a LaTeX maths block."
    (cond
     ((derived-mode-p 'latex-mode) (texmathp))
     ((derived-mode-p 'markdown-mode) (texmathp))
     ((derived-mode-p 'org-mode) (laas-org-mathp))
     (t (message "LaTeX-auto-activated snippets does not currently support math in any of %s"
		 (aas--modes-to-activate major-mode))
	nil)))
  ;; Condition for expanding snippets at the start of the line. This is useful
  ;; for what I consider "block" elements like align, figures, and tables.
  ;; Caveat is that if you type genali, it will still expand.
  (defun my/line-start ()
    (let ((symbol-bounds (bounds-of-thing-at-point 'symbol))
	  (line-start (line-beginning-position)))
      (when symbol-bounds
	(save-excursion
	  (goto-char (car symbol-bounds))
	  (skip-chars-backward " \t")
	  (= (point) line-start)))))
  ;; General snippets which should expand anywhere
  (aas-set-snippets 'laas-mode
    "mk"   '(tempel "$" p "$" q)
    "qty"  '(tempel "\\qty{" p "}" "{" p "}" q))
  ;; General snippets which should expand only on the beginning of the line
  (aas-set-snippets 'laas-mode
    :cond 'my/line-start
    "dm"   '(tempel "\\[" n> q n "\\]" >)
    "beg"  '(tempel "\\begin{" (s env) "}" n> q n "\\end{" (s env) "}" >)
    "fig"  '(tempel "\\begin{figure}" n> "\\centering" n> "\\caption{" p "}" n> "\\incfig{" q "}" > n "\\end{figure}" >)
    "enum" '(tempel "\\begin{enumerate}" n> "\\item " q > n "\\end{enumerate}" >)
    "item" '(tempel "\\begin{itemize}" n> "\\item " q > n "\\end{itemize}" >)
    "tabl" '(tempel "\\begin{table}[h]" n> "\\centering" n> q n "\\end{table}" > :post (my/latex-orgtb))
    "ali"  '(tempel "\\begin{align}" n> q n "\\end{align}" >))
  ;; Reset these snippets, we will override them later
  (aas-set-snippets 'laas-mode
    "RR" nil
    "QQ" nil
    "PP" nil)
  ;; Snippets which should expand in math mode only
  (aas-set-snippets 'laas-mode
    :cond 'texmathp 
    ;; Important snippets
    "dint" '(tempel "\\int" "_{" (p "0") "}^{" (p "x") "} " (p "f(x)")  "\\, " (p "dx"))
    "sum"  '(tempel "\\sum" "_{" (p "k = 0") "}^{" (p "\\infty") "} " q)
    "lim"  '(tempel "\\lim" "_{" (p "n \to \infty") "} " q)
    "part" '(tempel "\\frac{\\partial " (p "x") "}{\\partial " (p "y") "}")
    "mcal" '(tempel "\\mathcal{" p "}" q)
    "tt"   '(tempel "\\text{" p "}" q)
    "case" '(tempel "\\begin{cases}" n> q n "\\end{cases}" >)
    ;; Matrices and vectors
    "cvec" '(tempel "\\begin{pmatrix} " (p "x") " \\\\ \\vdots \\\\ " (p "x_{n}") " \\end{pmatrix}" q)
    "pmat" '(tempel "\\begin{pmatrix}" n> q n "\\end{pmatrix}" >)
    "mat"  '(tempel (p (read-number "Rows: ") rows noinsert)
		   (p (read-number "Cols: ") cols noinsert)
		   "\\begin{" (p "pmatrix" type) "}" n
		   >
		   (* (1- rows) (p " ") (* (1- cols) " & " (p " ")) "\\\\" n)
		   (p " ") (* (1- cols) " & " (p " ")) n
		   "\\end{" type "}" >)
    ;; Operations
    "sq"     '(tempel "\\sqrt{" (p "x") "}" q)
    "ceil"   '(tempel "\\left\\lceil " (p "x") " \\right\\rceil" q)
    "floor"  '(tempel "\\left\\lfloor " (p "x") " \\right\\rfloor" q)
    ;; Subscripts and Superscripts
    "invs"   "^{-1}"
    "td"     '(tempel "^{" p "}" q)
    "_"      '(tempel "_{" p "}" q)
    ;; Relations
    "->"  "\\rightarrow"
    "<-"  "\\leftarrow"
    "cc"  "\\subset"
    "c="  "\\subseteq"
    "nn"  "\\cap"
    "uu"  "\\cup"
    ;; Symbols
    "oo"   "\\infty"
    "pi"   "\\pi"
    "epsi" "\\epsilon"
    "nabl" "\\nabla"
    "lamb" "\\lambda"
    "OO"   "\\emptyset"
    "RR"   "\\R"
    "QQ"   "\\Q"
    "PP"   "\\P"
    ;; Delimiters
    "lrp" '(tempel "\\left( " p " \\right)" q)
    "lrb" '(tempel "\\left\\{ " p " \\right\\}" q)
    "lra" '(tempel "\\left\\langle " p " \\right\\rangle" q)
    "lrl" '(tempel "\\left| " p " \\right|" q)))
;;;
;;; Evil extensions for tex editing! Like the venerable vimtex
;;; Note to self, this uses mt* to toggle environments and not ts*
;;; which is probably better since t is used much more than m.
(use-package evil-tex
  :ensure t
  :after evil
  :hook (LaTeX-mode . evil-tex-mode))
;;;
;;
;; |* Utilities
;;
;;; Utilities, like spellchecking and other stuff
;;;
;;; Jinx, much faster alternative to flyspell which spells the end for my
;;; buffers...
(use-package jinx
  :ensure t
  :hook ((text-mode  . jinx-mode)
	 (latex-mode . jinx-mode))
  :config
  (general-def 'insert "C-l" #'jinx-correct)
  (general-def 'normal
    "]s" #'jinx-next
    "[s" #'jinx-previous))
;;
;; Direnv integration for emacs
(use-package envrc
  :ensure t
  :hook (on-first-file . envrc-global-mode))
;;;
;;; Calendar in emacs
(use-package calfw
  :ensure t
  :commands calfw-open-calendar-buffer
  :config
  ;; TODO: Kind of finicky need better solution
  (evil-set-initial-state 'calfw-calendar-mode 'insert)
  (evil-set-initial-state 'calfw-details-mode 'insert)
  ;; Better, less jarring colors (temporary for now, copied from repo)
  (set-face-attribute 'calfw-title-face nil :foreground "#f0dfaf" :weight 'bold :height 2.0 :inherit 'variable-pitch)
  (set-face-attribute 'calfw-header-face nil :foreground "#d0bf8f" :weight 'bold)
  (set-face-attribute 'calfw-sunday-face nil :foreground "#cc9393" :background "grey10" :weight 'bold)
  (set-face-attribute 'calfw-saturday-face nil :foreground "#8cd0d3" :background "grey10" :weight 'bold)
  (set-face-attribute 'calfw-holiday-face nil :background "grey10" :foreground "#8c5353" :weight 'bold)
  (set-face-attribute 'calfw-grid-face nil :foreground "DarkGrey")
  (set-face-attribute 'calfw-default-content-face nil :foreground "#bfebbf")
  (set-face-attribute 'calfw-periods-face nil :foreground "cyan")
  (set-face-attribute 'calfw-day-title-face nil :background "grey10")
  (set-face-attribute 'calfw-default-day-face nil :weight 'bold :inherit 'calfw-face-day-title)
  (set-face-attribute 'calfw-annotation-face nil :foreground "RosyBrown" :inherit 'calfw-face-day-title)
  (set-face-attribute 'calfw-disable-face nil :foreground "DarkGray" :inherit 'calfw-face-day-title)
  (set-face-attribute 'calfw-today-title-face nil :background "#7f9f7f" :weight 'bold)
  (set-face-attribute 'calfw-today-face nil :background "grey10" :weight 'bold)
  (set-face-attribute 'calfw-toolbar-face nil :foreground "Steelblue4" :background "Steelblue4")
  (set-face-attribute 'calfw-toolbar-button-off-face nil :foreground "Gray10" :weight 'bold)
  (set-face-attribute 'calfw-toolbar-button-on-face nil :foreground "Gray50" :weight 'bold)

  (general-def 'calfw-calendar-mode-map
    "h"   #'calfw-navi-previous-day-command
    "j"   #'calfw-navi-next-week-command
    "k"   #'calfw-navi-previous-week-command
    "l"   #'calfw-navi-next-day-command
    "RET" #'calfw-show-details-command
    "D"   #'calfw-change-view-day
    "M"   #'calfw-change-view-month
    "T"   #'calfw-change-view-two-weeks
    "W"   #'calfw-change-view-week)
  (general-def 'calfw-details-mode-map
    "q"   #'calfw-details-kill-buffer-command))
;;;
;;; org integration for calfw
(use-package calfw-org
  :ensure t
  :commands (calfw-org-open-calendar
             calfw-org-create-source
             calfw-org-create-file-source
             calfw-open-org-calendar-withkevin))
;;;
;;; Integrates org mode events with calfw
(use-package calfw-org
  :ensure t
  :after calfw
  :commands cfw:open-org-calendar)
;;;
;;; calfw time blocks
;; (use-package calfw-blocks
;;   :vc (:url "https://github.com/ml729/calfw-blocks.git" :rev :newest)
;;   :ensure t)
;;;
;;; Formatter
;;; TODO: decide whether to enable globally
(use-package apheleia
  :ensure t)
;;;
;;; Flymake backends, mostly for linting
(use-package flymake-shellcheck
  :ensure t
  :hook (sh-mode . flymake-shellcheck-load)
  :commands flymake-shellcheck-load)
;;;
;;; Dashboard, why not
(use-package dashboard
  :ensure t
  :demand t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 3)
  (setq dashboard-items '((recents . 5)))
  (setq dashboard-banner-logo-title "D E S P A I R")
  (setq dashboard-center-content t)
  (setq dashboard-vertically-center-content t)
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-set-footer nil))
;;;
;;; Reading feeds in emacs, feeding reads in emacs
(use-package elfeed
  :ensure t
  :commands elfeed
  :init
  (setq elfeed-db-directory (file-name-concat user-emacs-directory "data" "elfeed" "db/")
	elfeed-enclosure-default-dir (file-name-concat user-emacs-directory "data" "elfeed" "enclosures/"))
  :config
  (make-directory elfeed-db-directory t)
  (setq url-queue-time 30)
  (setq elfeed-feeds
	'(("https://www.reddit.com/r/emacs.rss" emacs reddit)
	  ("https://www.reddit.com/r/NixOS.rss" nixos reddit)
	  ("https://www.reddit.com/r/linux.rss" linux reddit)
	  ("https://www.phoronix.com/rss.php" linux)
	  ("https://sachachua.com/blog/feed/" emacs)
	  ("https://karl-voit.at/tags/software/" emacs)
	  ("https://www.redblobgames.com/blog/posts.xml"  game-programming)
	  ("https://fabiensanglard.net/rss.xml" game-programming)
	  ("https://ferd.ca/feed.rss" distributed-systems)
	  ("https://pythonspeed.com/atom.xml" python)
	  ("https://www.b-list.org/feeds/entries/" python)
	  ;; Personal favorite is writing python like it is rust
	  ("https://kobzol.github.io/feed.xml" rust python)
	  ("https://smallcultfollowing.com/babysteps//atom.xml" rust)
	  ("https://nullprogram.com/feed/" c)
	  ("https://mcyoung.xyz/feed.xml" optimization))))
;;;
;;; 
;; (use-package nano-calendar
;;   :ensure t
;;   :vc (:url "https://github.com/rougier/nano-calendar.git" :rev :newest)
;;   :commands (nano-calendar)
;;   :general-config
;;   (general-def 'normal 'nano-calendar-mode-map
;;     "l"   #'nano-calendar-goto-next-day
;;     "h"   #'nano-calendar-goto-prev-day
;;     "j"   #'nano-calendar-goto-next-week
;;     "k"   #'nano-calendar-goto-prev-week
;;     "]]" #'nano-calendar-goto-next-year
;;     "[[" #'nano-calendar-goto-prev-year
;;     ")" #'nano-calendar-goto-next-month
;;     "(" #'nano-calendar-goto-prev-month
;;     "."   #'nano-calendar-goto-today
;;     "q"   #'nano-calendar-quit
;;     "RET" #'nano-calendar-goto-org-agenda))
;;; End of the init file
