#!/usr/bin/bash

# this script converts \n to \s
# should ignore blank lines
# should ignore content in code fences
# should ignore the first line of items in ordered and unordered lists starting with a bullet (1., ^*, or ^-) but convert \n within individual item lists.

if [[$line]]
