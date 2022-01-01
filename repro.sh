#! /usr/bin/env sh

./clean.sh

cd b && yalc publish
cd ../a && yalc add b && npm i && yalc publish
cd ../root && yalc add a && npm i && node run
# expected to print
# module a: a
#
# instead errors since module b cannot be found.
# This is a result of root/.yalc/a/.yalc not existing.  Adding '.yalc' to
# package.json 'files' fixes the issue
