class FileReader
  include Singleton

  def initialize
    @filename = Rails.cache.read('filename')
    @offsets = Rails.cache.read('offsets')
  end

  def read_line(line_number)
    return nil if @offsets.nil?

    index = line_number - 1
    return nil if @offsets[index].nil?

    File.open(@filename, 'r') do |file|
      file.seek(@offsets[index])
      file.gets&.strip
    end
  end
end
