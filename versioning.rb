# create 3 bins from git docs...Client, Server, Ohai
# for each version, enumerate the .rst files
# for each version, compare the filenames to the immendiately preceeding version.
# => output added and deleted filenames as .csv

# compare the contents of the later files to immediately preceeding version.
# => output # of added lines, # deleted lines, and total # changes
# => output changed lines

# final output is a table y-axis file names, x-axis version.  cell contents #changes
# ideally cells link to logs of changed files, or to submitted changes

# LIST OUT THE ITEMS IN A DIRECTORY (Tree)

# /Users/kimberlygarmoe/repos/chef-web-docs
# git pull origin master
# git checkout pre-archive
# ls
# cd snapshots
# /Users/kimberlygarmoe/repos/chef-web-docs/snapshots
require 'create_tree'

#  create_tree.rb
def create_tree(directories, parent=".")
 directories.each_pair do |dir, files|
   path = File.join(parent, dir)
   Dir.mkdir path unless File.exists? path
   files.each do |filename, contents|
     if filename.respond_to? :each_pair  # It's a subdirectory
       create_tree filename, path
     else # It's a file
       open(File.join(path, filename), 'w') { |f| f << contents || "" }
     end
   end
 end
end

# find only .rst files
# 
require 'create_tree'
create_tree './'
require 'find'

Find.find('./') do |path|
  Find.match('./') do |p|
    Find.prune if p != ".rst"
    puts path
  end
end



# create an output file. dir_changes
File.open(out.csv, "a") {|f| f.puts newinfo }
