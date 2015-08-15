class CharactersController < ApplicationController
  before_action :signed_in_user, only: %i(new create)
  before_action :find_user
  before_action :correct_user, only: %i(new create)

  def new
    @character = @user.characters.build(player_name: @user.name)
  end

  def create
    @character = @user.characters.build(character_params)

    if @character.save
      redirect_to [@user, @character], flash: { success: t("alerts.characters.created") }
    else
      render :new
    end
  end

  def show
    @character = @user.characters.find(params[:id])
  end

  private

  PERMITTED_PARAMS = %i(
    name class_levels background player_name race alignment experience age
    height weight eyes skin hair
  )

  def character_params
    params.require(:character).permit(PERMITTED_PARAMS)
  end

  # before_action filters
  def find_user
    @user = User.find(params[:user_id])
  end

  def correct_user
    return if current_user?(@user)
    redirect_to root_url, alert: t("alerts.correct_user")
  end
end
