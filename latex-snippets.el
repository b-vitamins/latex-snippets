;;; latex-snippets.el --- LaTeX YASnippet collection -*- lexical-binding: t; -*-
;; Author: ChatGPT and Ayan
;; URL: https://github.com/yourusername/latex-snippets
;; Version: 0.1
;; Package-Requires: ((yasnippet "0.8.0"))

;;; Commentary:
;; A collection of LaTeX YASnippet snippets inspired by the "Short Math Guide for LaTeX"
;; by Michael Downes and Barbara Beeton.

;;; Code:

(require 'yasnippet)

(defvar latex-snippets-dir
  (expand-file-name "org-mode" (file-name-directory (or load-file-name buffer-file-name)))
  "Directory where the LaTeX snippets are stored.")

;;;###autoload
(defun latex-snippets-initialize ()
  "Load LaTeX YASnippet snippets."
  (add-to-list 'yas-snippet-dirs latex-snippets-dir)
  (yas-load-directory latex-snippets-dir))

;;;###autoload
(eval-after-load 'yasnippet
  '(latex-snippets-initialize))

(provide 'latex-snippets)

;;; latex-snippets.el ends here
