namespace :words do
  desc "rake task to populate words into words table"
  task populate: :environment do
    path = File.join(Rails.root, "data", "words_alpha.txt")
    count = 0
    lines = []
    File.read(path).each_line do |line|
      lines << { word: line.strip }
      if lines.size > 5_000
        puts "inserting"
        Word.insert_all!(lines)
        lines.clear
        count = 0
      end
    end
    if lines.size > 1
      Word.insert_all!(lines)
      puts "inserting one last time..."
    end
  end
end
