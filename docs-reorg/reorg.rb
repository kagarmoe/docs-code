require 'fileutils'

## Set the environment to your path
DIRECTORY = ENV.fetch('HABITATDOCS',
                      '/Users/kimberlygarmoe/repos/habitat/www/source/docs')

# Finds name and renames file
Dir.glob('*').each do |file|
  pattern=/name=\"[^\"]*/
  oldfile= file
  open(file) do |f|
    f.each_line do |li|
      li.to_s
      if li.scan(pattern).first
      match = li.scan(pattern).first
      filename = match[6..-1]
      oldfile = name
      # puts name
      end
    end
    filename=oldfile.concat(".html.md.erb")
    FileUtils.mv f, filename
  end
end
