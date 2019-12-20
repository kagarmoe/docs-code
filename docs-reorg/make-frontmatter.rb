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
fm = 1
line_count = 0
fm_count = 0
content = ""
frontmatter = ""
# matches for page title />(.*?)</
# matches for file name \"(.*?)\"
Dir.glob('*.html.md.erb').each do |file|
  pattern=/>(.*?)</
    open(file, "r+") do |f|
      f.each_line do |li|
        if li.match(pattern) do
          content = li.scan(pattern).first.to_s
          line_count = line_count + 1
          if line_count=result
          frontmatter = "---\ntitle: #{content}\ndescription: \n---\n"
          puts frontmatter
          end
        end
      end
    end
  end
end
