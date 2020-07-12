require "rails_helper"

RSpec.describe "RandomWord", type: :model do
  it "should return a random word" do
    expect(Kernel).to receive(:rand).with(370104).and_return(1)
    rw = RandomWord.new

    expect(rw.path).to eq(File.join(Rails.root, "data", "words_alpha.txt"))
    expect(rw.read).to eq("a")
  end
end
