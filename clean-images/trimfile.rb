list = []
used = []
search_text = %r{image::}
Dir.glob("/Users/kimberlygarmoe/repos/chef-web-docs/chef_master/source/*.rst").each do |file|
  File.readlines(file).each do |line|
    if line =~ search_text then
      file = file.sub("/Users/kimberlygarmoe/repos/chef-web-docs/chef_master/source/", "")
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

#puts list
puts used

