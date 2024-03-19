class PokemonsController < ApplicationController
  def index
    if params[:search].present?
      @pokemons = PokimonName.where("name LIKE ?", "%#{params[:search]}%").page(params[:page]).per(15)
    else
      @pokemons = PokimonName.page(params[:page]).per(15)
    end
  end
end

