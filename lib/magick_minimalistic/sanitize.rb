module Sanitize
  def self.filename(file, type)
    loop do
      return file if type && file.is_a?(String) && File.exist?(file)
      return file if !type && file.is_a?(String) && file.length > 0
      puts "The file -> #{file} <- doesn't exist or is not a String!"
      puts 'Please write a proper filename'
      file = gets.chomp
    end
  end

  def self.attributes(attrs)
    config = ""
    attrs.each do |key, value|
      unless /^(gravity|crop|resize)$/ =~ key
        puts 'The key is not a valid one'
        puts 'Ignoring wrong key...'
        next
      end
      value = type(key, value) if /^(gravity)$/ =~ key
      value = geometry(key, value) if /^(crop|resize)$/ =~ key
      config += Option.send(key, value)
    end
    config
  end

  def self.geometry(key, value)
    loop do
      return value if value.is_a?(String) && (/^\d+x\d+$/ =~ value || /^\d+%$/ =~ value)
      puts "The value (#{value}) for the key (#{key}) is not properly formed!"
      puts 'Write a valid value'
      value = gets.chomp
    end
  end

  def self.type(key, value)
    loop do
      return value if value.is_a?(String) &&
        /^(NorthWest|North|NortEast|West|Center|East|SouthWest|South|SouthEast)$/ =~ value
      puts "The value (#{value}) for the key (#{key}) is not properly formed!"
      puts 'Write a valid value'
      value = gets.chomp
    end
  end
end
