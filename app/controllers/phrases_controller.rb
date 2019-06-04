class PhrasesController < ApplicationController
  protect_from_forgery with: :null_session
  
  def random
    # TODO: Add an option to retrieve an indexed list of sayings
    # TODO: Add an option to pass in an index to get a specific saying
    
    #render plain: params[:text]
    if params[:text].upcase == "GOTEM"
      everything = Phrase.all
      the_menu = ""
      everything.each do |p|
        the_menu = the_menu + p.id.to_s + ": " + p.text + "\n"
      end
      render plain: the_menu
    elsif params[:text].to_i.to_s == params[:text]
      render json: { "response_type": "in_channel", "text": Phrase.find(params[:text].to_i).text }
    else
      @random_phrase = Phrase.order("RANDOM()").first
      render json: { "response_type": "in_channel", "text": @random_phrase.text }
    end
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
