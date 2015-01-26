class CharactersController < ApplicationController
  def show
    @character = User.find(params[:user_id]).characters.find(params[:id])
  end
end
