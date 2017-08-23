require 'rails_helper'

RSpec.describe RepositoriesController, type: :controller do
  let(:valid_attributes) {
    {
      github_id: 123,
      name: 'testing',
      url: 'http://github.com/mgiacomini/trending'
    }
  }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      repository = Repository.create! valid_attributes
      get :show, params: { id: repository.to_param }
      expect(response).to be_success
    end
  end
end
