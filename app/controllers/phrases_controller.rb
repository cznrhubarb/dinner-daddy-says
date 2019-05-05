require 'httpclient'

class PhrasesController < ApplicationController
  protect_from_forgery with: :null_session
  
  def random
    return render json: {}, status: 403 unless valid_slack_token?
    PhraseWorker.perform_async(phrase_params.to_h)
    render json: { response_type: "in_channel" }, status: :created
    #client = HTTPClient.new
    #client.post(SLACK_API_ENDPOINT, params)
    ##render plain: @random_phrase.text
  end

  def add  
    @phrase = Phrase.new(phrase_params)

    @phrase.save
  end

  private
  def valid_slack_token?
    params[:token] == ENV["SLACK_SLASH_COMMAND_TOKEN"]
  end

  def phrase_params
    params.require(:phrase).permit(:text)
  end

  def post_params
    @random_phrase = Phrase.order("RANDOM()").first

    {
      token: ENV['SLACK_OAUTH'],
      channel: @to,
      text: @random_phrase.text,
      as_user: false,
      link_names: true
    }
  end
end
