require 'rails_helper'

RSpec.describe SqueaksController, type: :controller do
  describe 'get#index' do
    it 'renders the squeaks index' do
      allow(subject).to receive(:logged_in?).and_return(true)
      # this line mimicks a logged in user
      
      get :index 
      # type of request, then action to hit

      expect(response).to render_template(:index)
    end
  end

  describe 'get#new' do
    it 'renders form to make a new squeak' do
      allow(subject).to receive(:logged_in?).and_return(true)

      get :new 

      expect(response).to render_template(:new)
    end
  end

  describe 'delete#destroy' do
    let!(:test_squeak) { create :squeak }

    before :each do
      allow(subject).to receive(:current_user).and_return(test_squeak.author)
      # assigns test_squeak author as current_user

      delete :destroy, params: { id: test_squeak.id }
    end

    it 'destroys the squeak' do
      expect(Squeak.exists?(test_squeak.id)).to be false
    end

    it 'redirects to squeaks_url' do
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(squeaks_url)
    end
  end

  describe 'post#create' do
    before :each do
      create :user
      allow(subject).to receive(:current_user).and_return(User.last)
    end

    let(:valid_params) { 
      { squeak: { 
          body: 'whatever we want', 
          author_id: User.last.id 
        } 
      } 
    }

    let(:invalid_params) {
      { squeak: {
          not_body: 'this is a bad squeak',
          author_id: User.last.id
        }
      }
    }

    context 'with valid params' do
      it 'creates the squeak' do
        post :create, params: valid_params
        # sends a post request to create a new squeak using the valid params we defined

        expect(Squeak.exists?(Squeak.last.id)).to be true
      end

      it 'redirects to the squeak show page' do
        post :create, params: valid_params

        expect(response).to redirect_to(squeak_url(Squeak.last.id))
      end
    end

    context 'with invalid params' do
      before :each do
        post :create, params: invalid_params
      end

      it 'redirects to new_squeak_url' do
        expect(response).to have_http_status(422)
        expect(response).to render_template(:new)
      end

      it 'adds errors to flash' do
        expect(flash[:errors]).to be_present
      end
    end

  end
end