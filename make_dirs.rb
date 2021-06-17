## This takes the directory /repos/habitat/www/source/docs
## And breaks long pages into shorter pages at H2
## -------------
## ONE:
## Creates directory for each page
## Moves long page into directory
## -------------
## TWO:
## Creates blank page
## Adds frontmatter to page
## Finds section matching regex on main page
## moves content to subpage, removing content from main page
## copies page title >TITLE< into frontmatter title field
## deletes Magellan line
## saves/closes page
## -------------
## THREE:
## fix links


require 'fileutils'

## Set the environment to your path
DIRECTORY = ENV.fetch('HABITATDOCS',
                      '/Users/kimberlygarmoe/repos/habitat/www/source/docs')

## Navigate to docs directory
FileUtils.cd DIRECTORY

## ONE:
## Creates directory for each
## Moves long page into directory

puts(Dir.glob("*.html.md.erb"))

Dir.glob("*.html.md.erb") do |f|
  #  puts(f.sub(/\..*/, ''))
   name=(f.sub(/\..*/, ''))
   Dir.mkdir(name)
   puts(name)
   FileUtils.mv(f, name)
end


## -------------
## TWO:

## regex to select H2 and content up to the following H2
# ^#{2}\s(\D+)(?=^#{2}\s)
