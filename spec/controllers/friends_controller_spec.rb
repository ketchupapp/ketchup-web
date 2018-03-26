require 'rails_helper'

RSpec.describe FriendsController, type: :controller do
  let(:valid_attributes) {
    {name: "Alice", user: user}
  }

  let(:invalid_attributes) {
    {}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FriendsController. Be sure to keep this updated too.
  let(:user) { User.create!(email: "andre@example.com", password: "aVerySecurePassword") }
  before { sign_in user, scope: :user }

  describe "GET #index" do
    it "returns a success response" do
      friend = Friend.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      friend = Friend.create! valid_attributes
      get :show, params: {id: friend.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      friend = Friend.create! valid_attributes
      get :edit, params: {id: friend.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Friend" do
        expect {
          post :create, params: {friend: valid_attributes}
        }.to change(Friend, :count).by(1)
      end

      it "redirects to the created friend" do
        post :create, params: {friend: valid_attributes}
        expect(response).to redirect_to(Friend.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {friend: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested friend" do
        friend = Friend.create! valid_attributes
        put :update, params: {id: friend.to_param, friend: new_attributes}
        friend.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the friend" do
        friend = Friend.create! valid_attributes
        put :update, params: {id: friend.to_param, friend: valid_attributes}
        expect(response).to redirect_to(friend)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        friend = Friend.create! valid_attributes
        put :update, params: {id: friend.to_param, friend: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested friend" do
      friend = Friend.create! valid_attributes
      expect {
        delete :destroy, params: {id: friend.to_param}
      }.to change(Friend, :count).by(-1)
    end

    it "redirects to the friends list" do
      friend = Friend.create! valid_attributes
      delete :destroy, params: {id: friend.to_param}
      expect(response).to redirect_to(friends_url)
    end
  end

end
