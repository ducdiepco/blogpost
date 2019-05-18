require 'rails_helper'

RSpec.describe 'User Controller', type: :request do
  describe 'GET #show' do
    context 'JSON request' do
      let!(:user) { create(:user) }
      let!(:posts) { create_list(:post, 2, user: user) }

      it 'returns a user with posts' do
        get "/users/#{user.id}.json"
        expect(response_status).to eq 200
        expect(json['name']).not_to eq nil
        expect(json['posts'].count).to eq 2
      end
    end
  end

  describe 'User not found' do
    it 'renders a 404 template' do
      get "/users/notexist"
      expect(response_status).to eq 404
      expect(response.body).to include 'The page you were looking for doesn\'t exist (404)'
    end
  end
end
