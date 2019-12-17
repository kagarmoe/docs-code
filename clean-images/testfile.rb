## search one file for /images::
## should return two lines

path = '/Users/kimberlygarmoe/repos/chef-web-docs/chef_master/source/chef_automate.rst'
search_text = %r{image::}

File.open(path) do |file|
  file.each_line do |line|
    puts("#{path}:#{line}") if line =~ search_text
  end
end