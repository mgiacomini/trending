require 'rails_helper'

RSpec.describe Repositories::GithubTrendingService, type: :service do
  let(:fake_response) { GithubResponse.fake! }

  describe '#search' do
    let(:repositories) { described_class.new.search 'language:elixir' }
    before do
      allow(Octokit).to receive(:search_repositories).and_return fake_response
    end

    it 'returns an Enumerable' do
      expect(repositories).to be_an Enumerable
    end

    it 'each element is instance of Repository' do
      repositories.each { |r| expect(r).to be_an Repository }
    end
  end

end
