class CharactersController < ApplicationController
  before_action :signed_in_user, except: :show
  before_action :find_user
  before_action :find_character, except: %i(new create)
  before_action :correct_user, except: :show

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
  end

  def edit
  end

  def update
    if @character.update(character_params)
      redirect_to [@user, @character], flash: { success: t("alerts.characters.updated") }
    else
      render :edit
    end
  end

  def destroy
    if @character.destroy
      redirect_to @user, flash: { success: t("alerts.characters.deleted") }
    else
      redirect_to @character
    end
  end

  private

  PERMITTED_PARAMS = %i(
    name background player_name race alignment experience age
    height weight eyes skin hair
  )

  def character_params
    params.require(:character).permit(PERMITTED_PARAMS)
  end

  # before_action filters
  def find_user
    @user = User.find(params.require(:user_id))
  end

  def find_character
    @character = @user.characters.find(params.require(:id))
  end

  def correct_user
    return if current_user?(@user)
    redirect_to root_url, flash: { alert: t("alerts.correct_user") }
  end
end
