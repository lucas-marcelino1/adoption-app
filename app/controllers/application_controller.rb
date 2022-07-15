class ApplicationController < ActionController::Base
  rescue_from Faraday::ConnectionFailed, with: :connection_failed
  before_action :configure_permitted_parameters, if: :devise_controller?

  def connection_failed
    flash.now[:notice] = "A conexão com o sistema de adoções não aconteceu!"
    render 'adoptions/index'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :city, :cpf])
  end
end
