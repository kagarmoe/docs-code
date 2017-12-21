## This takes the directory repos/chef-web-docs/chef_master/source
## Iterates over the files
## produces hashes filename.rst:imagename

## finds line containing "(images::)"
## output #{filename}:#{image}
#require 'find'
#files = Dir.entries("/Users/kimberlygarmoe/repos/chef-web-docs/chef_master/source")

require 'set'

list = []
used = []
images = []
unused = []
search_text = %r{image::}

# create an array of filename:imagename
# create an array of sorted and deduped images used in docs
# clean up the elements
Dir.glob("/Users/kimberlygarmoe/repos/chef-web-docs/chef_master/source/*.rst").each do |file|
  File.readlines(file).each do |line|
    if line =~ search_text then
      file = file.sub("/Users/kimberlygarmoe/repos/chef-web-docs/chef_master/source/", "")
      file = file.gsub(/^\s/, "")
      line = line.sub(".. image:: ../../images/", "")
      line = line.gsub(/^\s\s\s\s/, "")
      line = line.gsub(/^\s\s\s/, "")
      line = line.gsub(/^\s\s/, "")
      line = line.gsub(/^\s/, "")
      line = line.gsub(/^* - /, "")
      line = line.gsub(/\*/, "")
      line = line.gsub(/.. image::  ..(\/)..(\/)images(\/)/, "")
      list << "#{file}:#{line}"
      used << "#{line}"
    end
  end
end

used.sort!.uniq!

#Create a sorted array of images in the image folder

Dir.glob("/Users/kimberlygarmoe/repos/chef-web-docs/images/*.*").each do |image|
  image = image.sub("/Users/kimberlygarmoe/repos/chef-web-docs/images/", "")
  images << "#{image}"
end

images.sort!.uniq!

#Count of arrays & differenct 
puts images.count
puts images.kind_of?(Array)
puts used.count
puts used.kind_of?(Array)
#puts (images.count - used.count)

#images = images.map{ |i|  %Q('#{i}') }.join(',')
#used = used.map{ |i|  %Q('#{i}') }.join(',')
#puts images
#puts "########################################"
#puts used
# Create list of unused images
#unused = images - used
#puts unused.count

set_images = images.to_set
set_used = used.to_set
set_unused = set_images - set_used
puts set_unused.count
puts set_unused
