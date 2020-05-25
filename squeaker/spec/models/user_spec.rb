require 'rails_helper'

RSpec.describe User, type: :model do
  # validation tests
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  # association tests
  it { should have_many(:squeaks) }

  describe 'uniqueness' do
    before :each do
      create :user
      # users :user factory to create a user in our DB before each test
    end

    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
  end

  describe 'is_password?' do
    let!(:user) { create :user }
    # (:user) is naming our variable. 
    # { create :user } is creating user from user factory

    context 'with a valid password' do
      it 'should be true' do
        expect(user.is_password?('starwars')).to be true
        # user references the :user created by our let! block
      end
    end

    context 'with an invalid password' do
      it 'should be false' do
        expect(user.is_password?('not_star_wars')).to be false
      end
    end
  end
  
end