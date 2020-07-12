require "rails_helper"

RSpec.describe WordsController, type: :controller do
  context "#index" do
    it "should have route defined to words index" do
      expect(get: "/words").to be_routable
    end

    it "should return 200 everytime" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  context "#show" do
    it "should have route defined to words show" do
      expect(get: "/words").to be_routable
    end

    it "should return a random word" do
      word = "imaginative"
      expect(Word).to receive(:count).and_return(5)
      expect(Kernel).to receive(:rand).with(5).and_return(5)
      word_struct = OpenStruct.new(word: word)
      expect(Word).to receive(:find).and_return(word_struct)
      get :show, params: { id: :random }

      body = Oj.load(response.body)
      expect(body["word"]).to eq(word)
    end
  end
end
