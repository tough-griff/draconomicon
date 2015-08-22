require "rails_helper"

RSpec.describe CharactersController do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:character) { create(:character, user: user) }

  describe "GET 'new'" do
    context "unauthenticated" do
      before { get :new, user_id: user.id }

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    context "as the wrong user" do
      before do
        sign_in other_user
        get :new, user_id: user.id
      end

      it { is_expected.to redirect_to(root_path) }
    end

    context "as the correct user" do
      before do
        sign_in user
        get :new, user_id: user.id
      end

      it { is_expected.to render_template(:new) }

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

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    context "as the wrong user" do
      before do
        sign_in other_user
        post :create, user_id: user.id, character: attributes_for(:character)
      end

      it { is_expected.to redirect_to(root_path) }
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
          is_expected.to render_template(:new)
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
          is_expected.to redirect_to([user, Character.last])
        end
      end
    end
  end

  describe "GET 'show'" do
    before { get :show, user_id: user.id, id: character.id }

    it { is_expected.to render_template(:show) }

    it "assigns the correct character" do
      expect(assigns(:character)).to eq(character)
    end
  end

  describe "GET 'edit'" do
    context "unauthenticated" do
      before { get :edit, user_id: user.id, id: character.id }

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    context "as the wrong user" do
      before do
        sign_in other_user
        get :edit, user_id: user.id, id: character.id
      end

      it { is_expected.to redirect_to(root_path) }
    end

    context "as the correct user" do
      before do
        sign_in user
        get :edit, user_id: user.id, id: character.id
      end

      it { is_expected.to render_template(:edit) }

      it "assigns the correct user" do
        expect(assigns(:user)).to eq(user)
      end

      it "assigns a new character" do
        expect(assigns(:character)).to eq(character)
      end
    end

  end

  describe "PUT 'update'" do
    context "unauthenticated" do
      before { put :update, user_id: user.id, id: character.id, character: attributes_for(:character) }

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    context "as the wrong user" do
      before do
        sign_in other_user
        put :update, user_id: user.id, id: character.id, character: attributes_for(:character)
      end

      it { is_expected.to redirect_to(root_path) }
    end

    context "as the correct user" do
      before { sign_in user }

      context "with invalid attributes" do
        it "does not update the character" do
          expect do
            put :update, user_id: user.id, id: character.id, character: attributes_for(:character, :invalid)
          end.not_to change(character, :name)
        end

        it "re-renders the 'edit' template" do
          put :update, user_id: user.id, id: character.id, character: attributes_for(:character, :invalid)
          is_expected.to render_template(:edit)
        end
      end

      context "with valid attributes" do
        it "updates the character's attributes" do
          expect do
            put :update, user_id: user.id, id: character.id, character: attributes_for(:character, name: "New Name")
            character.reload
          end.to change(character, :name).to("New Name")
        end

        it "redirects to the edited character" do
          put :update, user_id: user.id, id: character.id, character: attributes_for(:character, name: "New Name")
          is_expected.to redirect_to([user, character])
        end
      end
    end
  end

  describe "DELETE 'destroy'" do
    context "unauthenticated" do
      it "does not delete the character" do
        expect do
          delete :destroy, user_id: user.id, id: character.id
        end.not_to change(Character, :count)
      end

      it "redirects to the sign-in page" do
        delete :destroy, user_id: user.id, id: character.id
        is_expected.to redirect_to(new_user_session_path)
      end
    end

    context "as the wrong user" do
      before { sign_in other_user }

      it "does not delete the character" do
        expect do
          delete :destroy, user_id: user.id, id: character.id
        end.not_to change(Character, :count)
      end

      it "redirects to the root page" do
        delete :destroy, user_id: user.id, id: character.id
        is_expected.to redirect_to(root_path)
      end
    end

    context "as the correct user" do
      before { sign_in user }

      it "deletes the character" do
        expect do
          delete :destroy, user_id: user.id, id: character.id
        end.to change(Character, :count).by(-1)
      end

      it "redirects to the user page" do
        delete :destroy, user_id: user.id, id: character.id
        is_expected.to redirect_to(user)
      end
    end
  end
end
