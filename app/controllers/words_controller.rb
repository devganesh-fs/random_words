class WordsController < ApplicationController
  def index
  end

  def show
    random_number = Kernel.rand(Word.count)
    render json: { word: Word.find(random_number).word }
  end
end
