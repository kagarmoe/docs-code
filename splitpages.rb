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
## Regex pattern
# PATTERN =(/^#{2}\s(\D+)(?=^#{2}\s)/)
H2=/^#{2}\s/
## Navigate to docsf directory
FileUtils.cd DIRECTORY
# puts(FileUtils.pwd)
## ONE:
## Creates directory for each
## Moves long page into directory

# puts(Dir.glob("*.html.md.erb"))

# Dir.glob("*.html.md.erb") do |f|
#   #  puts(f.sub(/\..*/, ''))
#    name=(f.sub(/\..*/, ''))
#    Dir.mkdir(name)
#    puts(name)
#    FileUtils.mv(f, name)
# end


## -------------
## TWO:

Dir.each_child(DIRECTORY) do |d|
  if File.directory?(d)
    FileUtils.cd(d)
    Dir.glob("*.html.md.erb") do |f|
      File.open(f).each_line do |l|
        if l.match(/^[#]{2}\s(.+)$/)
          str=l
          puts(str)
          newname=str.match(/>([\w|\s]+)</m)
          puts(newname)
        end
    end
  end
end

    # puts(FileUtils.pwd)
    # FileUtils.cd(DIRECTORY)

    # puts(FileUtils.pwd)

# puts(Dir.each)
## regex to select H2 and content up to the following H2

end
