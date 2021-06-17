#!/bin/bash
DIR="/Users/kimberlygarmoe/repos/chef-web-docs/content/"
FILES=`ls -r "$DIR" `
for file in $FILES;
do
#  Ignore frontmatter
\+{3}\n[\s\S]+?\+{3}
# Ignore code fences
\`{3}[\s\S]+?\`{3}
# Ignore lists
^-.*$
# Do this on everything else
(\S)[ \t]*(?:\r\n|\n)[ \t]*(\S)
done
