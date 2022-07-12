class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
  end
end