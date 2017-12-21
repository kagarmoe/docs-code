list = {}
images = []

Dir.glob("/Users/kimberlygarmoe/repos/chef-web-docs/images/*.*").each do |image|
  image = image.sub("/Users/kimberlygarmoe/repos/chef-web-docs/images/", "")
  images << "#{image}"
end

puts images