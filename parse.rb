require 'rubygems'
require 'open-uri'
require 'nokogiri'

PAGE_URL = "https://docs.chef.io/resource_apt_package.html"

page = Nokogiri::HTML(open(PAGE_URL))

puts page.css("title")[0].name
puts page.css("title")[0].text
puts page.css("h1")[0].name
puts page.css("h1")[0].text
puts page.css("h2")[0].name
puts page.css("h2")[0].text
puts page.css("h3")[0].name
puts page.css("h3")[0].text
# puts page.css("div[class=body]").name
# puts page.css("div[class=body]").text
