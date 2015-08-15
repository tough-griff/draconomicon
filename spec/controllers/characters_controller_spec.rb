require "rails_helper"

RSpec.describe CharactersController do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:character) { create(:character, user: user) }

  describe "GET 'new'" do
    context "unauthenticated" do
      before { get :new, user_id: user.id }

      it "redirects to the signin page" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "as the wrong user" do
      before do
        sign_in other_user
        get :new, user_id: user.id
      end

      it "redirects to the root" do
        expect(response).to redirect_to(root_path)
      end
    end

    context "as the correct user" do
      before do
        sign_in user
        get :new, user_id: user.id
      end

      it "renders the new template" do
        expect(response).to render_template(:new)
      end

      it "assigns the correct user" do
        expect(assigns(:user)).to eq(user)
      end

      it "assigns a new character" do
        expect(assigns(:character)).to be_a_new(Character)
      end
    end
  end

  describe "POST 'create'" do
    context "unauthenticated" do
      before { post :create, user_id: user.id, character: attributes_for(:character) }

      it "redirects to the signin page" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "as the wrong user" do
      before do
        sign_in other_user
        post :create, user_id: user.id, character: attributes_for(:character)
      end

      it "redirects to the root" do
        expect(response).to redirect_to(root_path)
      end
    end

    context "as the correct user" do
      before { sign_in user }

      context "with invalid attributes" do
        it "does not create a new character" do
          expect do
            post :create, user_id: user.id, character: attributes_for(:character, :invalid)
          end.not_to change(Character, :count)
        end

        it "re-renders the 'new' template" do
          post :create, user_id: user.id, character: attributes_for(:character, :invalid)
          expect(response).to render_template(:new)
        end
      end

      context "with valid attributes" do
        it "creates a new character" do
          expect do
            post :create, user_id: user.id, character: attributes_for(:character)
          end.to change(Character, :count).by(1)
        end

        it "redirects to the new character" do
          post :create, user_id: user.id, character: attributes_for(:character)
          expect(response).to redirect_to([user, Character.last])
        end
      end
    end
  end

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
