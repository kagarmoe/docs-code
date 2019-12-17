## TWO:
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
# DIRECTORY = ENV.fetch('HABITATDOCS',
#                       '/Users/kimberlygarmoe/repos/habitat/www/source/docs')
# ## Navigate to docsf directory
# FileUtils.cd DIRECTORY

## -------------
## TWO:
# This iterates through all subdirectories
# Dir.each_child(DIRECTORY) do |d|
#   if File.directory?(d)
#     FileUtils.cd(d)

# Finds name and renames file
    Dir.glob('*').each do |file|
      pattern=/name=\"[^\"]*/
      oldfile= file
      open(file) do |f|
        f.each_line do |li|
          li.to_s
          if li.scan(pattern).first
          match = li.scan(pattern).first
          name = match[6..-1]
          oldfile = name
          # puts name
          end
        end
        newfile=oldfile.concat(".html.md.erb")
        FileUtils.mv f, newfile
      end
    end
      # puts(FileUtils.pwd)
      # FileUtils.cd(DIRECTORY)
#   end
# end



    # puts(FileUtils.pwd)

# puts(Dir.each)
## regex to select H2 and content up to the following H2

