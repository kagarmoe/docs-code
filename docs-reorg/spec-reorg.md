When this is done the hab docs will have:
1. Sub-directories for each "main topic"
2. With correctly descending headers
3. That work with navigation

Specific requirements:
1. Each sub-directory has files from the original doc's h2
2. Each sub-directory has a main topic page and is correctly wired into the sidebar
3. Each file is named from the origin h2's id field
4. Each file has a title from the original section title
5. Each file has properly-formed frontmatter
6. Each file is wired into the sidebar
7. Remove Magellan lines
8. Conform Markdown heading levels

Thoughts:
* Start in the middle. Most of this comes from the magellan line
* Create a frontmatter object that I can use to push title into and then push object into file.
* I keep finding new ways in which our docs are badly formed
* to split files at h2 use: gcsplit -f habitat-and-other-software habitat-and-other-software.html.md.erb '/^##\s/' '{*}'
