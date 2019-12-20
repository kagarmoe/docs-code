1. gcsplit -f habitat-and-other-software habitat-and-other-software.html.md.erb '/^##\s/' '{*}'
2. manual cleanup, if necessary
3. ruby ~/repos/docs-code/docs-reorg/rename.rb
4. touch tmp.txt
5. make frontmatter >> tmp.txt
6. ruby ~/repos/docs-code/docs-reorg/make-frontmatter.rb >> tmp.txt

gcsplit -f using-habitat using-habitat.html.md.erb '/^##\s/' '{*}'
rm -f using-habitat.html.md.erb
ruby ~/repos/docs-code/docs-reorg/rename.rb
touch tmp.txt
ruby ~/repos/docs-code/docs-reorg/make-frontmatter.rb >> tmp.txt

1. manually insert frontmatter
2. rm tmp.txt
3.  fix links in data/docs_sidebar.yml
4.  fix links in www
5.  fix links like `reference#*` `reference/*`
6.  clean up headers
   1. ~/repos/habitat/www/source/docs/
7.  strip final `---`
8.  lint markdown
9.  bundle exec middleman serve
10. git add .
11. git add ../../../data/docs_sidebar.yml
12. git commit
13. git push origin kg/
14. git checkout master


FINALFINAL
