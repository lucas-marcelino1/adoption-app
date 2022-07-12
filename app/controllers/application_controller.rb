class ApplicationController < ActionController::Base
  rescue_from Faraday::ConnectionFailed, with: :connection_failed
  

  def connection_failed
    flash.now[:notice] = "A conexão com o sistema de adoções não aconteceu!"
    render 'adoptions/index'
  end
end
