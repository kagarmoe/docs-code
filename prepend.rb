def file_prepend(file, str)
  new_contents = ""
  File.open(file, 'r') do |fd|
    contents = fd.read
    new_contents = str << contents
  end
  # Overwrite file but now with prepended string on it
  File.open(file, 'w') do |fd|
    fd.write(new_contents)
  end
end

Dir.glob('*.html.md.erb').each do |file|
  file_prepend(file, "---\ntitle:\ndescription:\n---\n")
end
