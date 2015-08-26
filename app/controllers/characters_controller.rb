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
      redirect_to [@user, @character], flash: {
        success: t("alerts.characters.create.success", name: @character.name)
      }
    else
      flash.now[:error] = t("alerts.characters.create.failure")
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @character.update(character_params)
      redirect_to [@user, @character], flash: {
        success: t("alerts.characters.update.success", name: @character.name)
      }
    else
      flash.now[:error] = t("alerts.characters.update.failure")
      render :edit
    end
  end

  def destroy
    if @character.destroy
      redirect_to @user, flash: {
        success: t("alerts.characters.delete.success", name: @character.name)
      }
    else
      redirect_to @character, flash: {
        error: t("alerts.characters.delete.failure")
      }
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
    redirect_to root_path, flash: { alert: t("alerts.correct_user") }
  end
end
