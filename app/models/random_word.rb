class RandomWord
  attr_reader :path

  def initialize(path = File.join(Rails.root, "data", "words_alpha.txt"))
    @path = path
    @line_count = File.read(path).each_line.count
  end

  def read
    file = File.read(path)
    count = 1
    random_line = Kernel.rand(@line_count)
    file.each_line do |line|
      return line.strip if count == random_line
      count += 1
    end
    nil
  end
end
