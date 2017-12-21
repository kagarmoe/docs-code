## This takes the directory repos/chef-web-docs/chef_master/source
## and the directory repos/chef-web-docs/images.
## Produces a list of unused images

# require set
require 'set'

# initialize set
used = Set.new
images = Set.new
unused = Set.new
search_text = %r{image::}

# create an array of images used in the docs
# clean up the elements
Dir.glob("/Users/kimberlygarmoe/repos/chef-web-docs/chef_master/source/*.rst").each do |file|
  File.readlines(file).each do |line|
    if line =~ search_text then
      ## A lot of work to clean up the file names.
      line = line.sub(".. image:: ../../images/", "")
      line = line.gsub(/^\s\s\s\s/, "")
      line = line.gsub(/^\s\s\s/, "")
      line = line.gsub(/^\s\s/, "")
      line = line.gsub(/^\s/, "")
      line = line.gsub(/^* - /, "")
      line = line.gsub(/\*/, "")
      line = line.gsub(/.. image::  ..(\/)..(\/)images(\/)/, "")
      # saves files to used
      used << "#{line}"
    end
  end
end

#Create a sorted array of images in the image folder

Dir.glob("/Users/kimberlygarmoe/repos/chef-web-docs/images/*.*").each do |image|
  image = image.sub("/Users/kimberlygarmoe/repos/chef-web-docs/images/", "")
  images << "#{image}"
end

#Count of arrays & differenct 
puts images.count
puts images.kind_of?(Set)
puts images
puts ""
puts used.count
puts used.kind_of?(Set)
puts used
puts ""
puts "The difference between images and used = ", ( images - used )
puts ""
unused = (images - used)
puts unused.count
puts unused.kind_of?(Set)
puts unused
#puts (images.count - used.count)

#images = images.map{ |i|  %Q('#{i}') }.join(',')
#used = used.map{ |i|  %Q('#{i}') }.join(',')
#puts images
#puts "########################################"
#puts used
# Create list of unused images
#unused = images - used
#puts unused.count


#unused = (images - used)
#puts set_unused.count
#puts set_unused
