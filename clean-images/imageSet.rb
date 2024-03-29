## This takes the directory repos/chef-web-docs/chef_master/source
## and the directory repos/chef-web-docs/images.
## Produces a list of unused images

# require set
require 'set'
require 'FileUtils'

DIRECTORY = ENV.fetch('CHEFWEBDOCS',
                      '/Users/kimberlygarmoe/repos/chef-web-docs/')
# initialize set
used = Set.new
images = Set.new
search_text = %r{image::}
# fileutils.
# create an array of images used in the docs
# clean up the elements
Dir.glob("#{DIRECTORY}/chef_master/source/*.rst").each do |file|
  File.readlines(file).each do |line|
    if line =~ search_text then
      ## A lot of work to clean up the file names.
      line = line.sub(".. image:: ../../images/", '')
      line = line.gsub(/^\s\s\s\s/, '')
      line = line.gsub(/^\s\s\s/, '')
      line = line.gsub(/^\s\s/, '')
      line = line.gsub(/^\s/, '')
      line = line.gsub(/^* - /, '')
      line = line.gsub(/\*/, '')
      line = line.gsub(/.. image::  ..(\/)..(\/)images(\/)/, '')
      # saves files to used
      used << line.strip
    end
  end
end

# Create a sorted array of images in the image folder

Dir.glob("#{DIRECTORY}/images/*.*").each do |image|
  image = image.sub("#{DIRECTORY}/images/", '')
  images << image.strip
end

# remove nil and '' values from Set (there could be 1 of each)
images.reject!(&:nil?) && images.reject!(&:empty?)
used.reject!(&:nil?) && used.reject!(&:empty?)

# Count of arrays & different
puts "#\n# IMAGES\n#\n"
puts images.to_a
puts "number of images: #{images.length}\n\n"

puts "#\n# USED\n#\n"
puts used.to_a
puts "number of used: #{used.length}\n\n"

# Used images that are used but do not exist
unused = images - used
puts "#\n# UNUSED\n#\n"
unused_a = unused.to_a.sort!

# prints list of unused images
puts unused_a
puts "number of unused: #{unused.length}\n"
puts "difference between images and used: #{images.length - used.length}\n\n"

output = File.open("unused_images.txt", "w") 
output << unused_a
output.close

# for item in unused_a do |item|
#   check if item is in Dir glob ... images
#   if not then
#     move image to unused_images.txt 
#   end 
# end

# path = '~/repos/chef-web-docs/images'
# Dir.foreach(path) do |filename|
#   next if filename == '.' || filename == '..'

#   puts "working on #{filename}"

#   file = File.open("#{path}/#{filename}", 'r')

#   #some code

#   file.close

#   # more code
# end