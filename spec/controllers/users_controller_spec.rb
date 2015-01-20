require "rails_helper"

RSpec.describe UsersController do
  let(:user) { create(:user) }

  describe "GET 'show'" do
    before { get :show, id: user.id }

    it "renders the show template" do
      expect(response).to render_template(:show)
    end

    it "assigns the correct user" do
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET 'index'" do
    before do
      2.times do
        create(:user)
      end
      get :index
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "assigns an array of users" do
      expect(assigns(:users)).to eq(User.first(3))
    end
  end
end
