require 'wordlist'

list = Wordlist::FlatFile.new('~/test/chef.txt')
list.each_word do |word|
  puts word
  list >> '~/test/text.txt'
end
