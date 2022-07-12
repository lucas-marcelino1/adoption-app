class AdoptionsController < ApplicationController

  def index
    @adoptions = Adoption.all
  end

  def show
    response = Faraday.get("http://localhost:4000/api/v1/adoptions/#{params[:id]}")
    @adoption = JSON.parse(response.body)
  end
end