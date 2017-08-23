require 'rails_helper'

RSpec.describe "Repositories", type: :request do
  describe "GET /repositories" do
    it "works!" do
      get repositories_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /repositories/search" do
    it "works!" do
      get search_repositories_path
      expect(response).to have_http_status(200)
    end
  end
end
