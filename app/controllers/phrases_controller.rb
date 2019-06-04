class PhrasesController < ApplicationController
  protect_from_forgery with: :null_session
  
  def random
    # TODO: Add an option to retrieve an indexed list of sayings
    # TODO: Add an option to pass in an index to get a specific saying
    
    render plain: phrase_params[:text]
    #@random_phrase = Phrase.order("RANDOM()").first
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
