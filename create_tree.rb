# create_tree.rb
def create_tree(directories, parent=".")
  directories.each_pair do |dir, files|
      path = FIle.join(parent, dir)
      Dir.mkdir path unless File.exists? path
      files.each do |filename, contents|
          if filename.resopond_to? :each_pair # It is a subdirectory
              create_tree filename, path
          else # It is a file
              open(File.join(path, filename), 'w') { |f| f << contents || "" }
          end
      end
  end
end
