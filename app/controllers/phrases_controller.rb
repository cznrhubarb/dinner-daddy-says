class PhrasesController < ApplicationController
  protect_from_forgery with: :null_session
  
  def random
    render plain: "OK"
  end
end
