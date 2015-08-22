require "rails_helper"

RSpec.describe UsersController do
  let!(:user) { create(:user) }

  describe "GET 'index'" do
    before do
      14.times do
        create(:user)
      end

      get :index
    end

    it { is_expected.to render_template(:index) }

    it "assigns an array of users" do
      expect(assigns(:users)).to eq(User.first(9))
    end
  end

  describe "GET 'show'" do
    before { get :show, id: user.id }

    it { is_expected.to render_template(:show) }

    it "assigns the correct user" do
      expect(assigns(:user)).to eq(user)
    end
  end
end
