# frozen_string_literal: true

desc 'Process a file and store offsets of each line in cache'
task :process_file, [:filename] => :environment do |_, args|
  filename = args[:filename]
  return puts 'Error: File does not exist.' unless File.exist?(filename)

  offsets = [0]

  File.open(filename, 'r') do |file|
    # Read the file line by line and record the byte position for each line
    while file.gets
      offsets << file.pos # Store the byte position after each line
    end
  end

  # Store offsets in Rails cache (chache store for dev is file_store /tmp/cache/files)
  Rails.cache.write('offsets', offsets)
  Rails.cache.write('filename', filename)

  puts "Offsets stored in memory for file #{filename}."
end
