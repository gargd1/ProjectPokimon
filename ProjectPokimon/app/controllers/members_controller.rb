class MembersController < ApplicationController
  def show
    @pokemon = PokimonName.find(params[:id])
  end
end
