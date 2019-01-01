#! /bin/bash

if [ -f ~/.emacs ]
then
    echo "DOT emacs already exists"
else
    cp emacs.d/DOT_emacs ~/.emacs
    chmod 0666 ~/.emacs
fi

if [ ! -d ~/.emacs.d ]
then
    mkdir ~/.emacs.d
fi


PACKAGES="${PACKAGES} ztree"
PACKAGES="${PACKAGES} clang-format"
PACKAGES="${PACKAGES} flymd"

MANUAL_PACKAGES="${MANUAL_PACKAGES} eopengrok"


# FROM HERE: https://gist.github.com/padawanphysicist/d6299870de4ef8ad892f

#!/bin/bash
#
# I wrapped the code constructed in
#
# http://hacks-galore.org/aleix/blog/archives/2013/01/08/install-emacs-packages-from-command-line
#
# in a single bash script, so I would a single code snippet.
#

# Package to be installed
pkg_name=$1

# Elisp script is created as a temporary file, to be removed after installing 
# the package
elisp_script_name=$(mktemp /tmp/emacs-pkg-install-el.XXXXXX)

elisp_code="
;;
;; Install package from command line. Example:
;;
;;   $ emacs --batch --expr \"(define pkg-to-install 'smex)\" -l emacs-pkg-install.el
;;
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '(\"melpa\" . \"http://melpa.milkbox.net/packages/\") t)
(add-to-list 'package-archives
             '(\"marmalade\" . \"http://marmalade-repo.org/packages/\") t)
;; Fix HTTP1/1.1 problems
(setq url-http-attempt-keepalives nil)
(package-refresh-contents)
(package-install pkg-to-install)"

echo "$elisp_code" > $elisp_script_name



for pkg_name in ${PACKAGES}
do
    set -x 
    emacs --batch --eval "(defconst pkg-to-install '$pkg_name)" -l $elisp_script_name
done

rm -f "$elisp_script_name"


for x in ${MANUAL_PACKAGES}
do
    echo "You must manually install: ${x}"
done



