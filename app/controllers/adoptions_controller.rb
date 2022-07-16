class AdoptionsController < ApplicationController
  before_action :authenticate_pet_care!, only: [:show]

  def index
    @adoptions = Adoption.all
  end

  def show
    @adoption = Adoption.find(params[:id])
  end

  def adopt
    @adoption = Adoption.find(params[:id])
    PetCareAnimal.create!(pet_care: current_pet_care, animal_id: @adoption.animal_id)
    response = Faraday.patch("http://localhost:4000/api/v1/adoptions/#{params[:id]}/adopt")
    redirect_to root_path, notice: (JSON.parse(response.body))["message"]
  end
end