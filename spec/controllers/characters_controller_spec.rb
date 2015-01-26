require "rails_helper"

RSpec.describe CharactersController do
  let(:user) { create(:user) }
  let(:character) { create(:character, user: user) }

  describe "GET 'show'" do
    before { get :show, user_id: user.id, id: character.id }

    it "renders the show template" do
      expect(response).to render_template(:show)
    end

    it "assigns the correct character" do
      expect(assigns(:character)).to eq(character)
    end
  end
end
