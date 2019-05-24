class PhrasesController < ApplicationController
  
  def random
    render plain: @random_phrase.text
    #render json: { "response_type": "in_channel", "text": @random_phrase.text }
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
