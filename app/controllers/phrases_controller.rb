class PhrasesController < ApplicationController
  protect_from_forgery with: :null_session
  
  def random
    @random_phrase = Phrase.order("RANDOM()").first
    @random_phrase.inspect
    render plain: @random_phrase.text
  end

  def add  
    @phrase = Phrase.new(phrase_params)

    @phrase.save
  end

  private
  def phrase_params
    params.require(:phrase).permit(:text)
  end
end
