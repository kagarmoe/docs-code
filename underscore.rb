input = File.read(ARGV[0])

output = input.split("\n").each do |line|
  # Skip if line starts with 4 or more spaces
  next if line =~ /^ {4,}/

  # Skip unless line contains a word with underscore(s)
  next unless line =~ /\w+(?=_\w+)\w+/

  # Go through each line and fix underscores
  line.scan(/.\w+(?=_\w+)\w+./).each do |word|
    # Skip if word is preceded by a backtick
    next if word =~ /`/

    # Skip if word preceded by a forward or back slash
    next if word =~ /\\|\//

    # Fix the word and replace the original in line
    fixed_word = word.gsub('_', '\_')
    line.gsub!(word, fixed_word)
  end
end

puts output