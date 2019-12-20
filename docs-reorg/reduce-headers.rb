#string.sub!(/#+/)

Dir.glob('*.html.md.erb').each do |file|
  pattern=(/"anchor">(.*?)</)
    open(file, "w+") do |f|
      f.each_line do |li|
        string.sub!(/(#+)/, "")
      end
    end
  end


