# Find the title content between >(...)<
# Example string
# ## <a name="best-practices" id="best-practices" data-magellan-target="best-practices">Chef Habitat Best Practice Guides</a>
# Insert content after 'title:' in frontmatter should be 'title:' + ' 'content'

require 'fileutils'

# Set the environment to your path
# PATH = ENV.fetch('HABITATDOCS',
                        # '/Users/kimberlygarmoe/repos/habitat/www/source/docs')
## Navigate to docsf directory
# FileUtils.cd PATH

# def dir(name)
#   FileUtils.cd(name)
# end

result = 1
fm_field = 1
line_count = 0
title_count = 0
content = ""
fm = ""

Dir.glob('*.html.md.erb').each do |file|
  pattern=/>(.*?)</
    open(file) do |f|
      f.each_line do |li|
        if li.match(pattern) do
          content = li.scan(pattern).first
          line_count = line_count + 1
          if line_count=result
           fm= "title: #{content}"
           fm.to_s
           puts fm
          end
        end
      end
    end
  end
end

