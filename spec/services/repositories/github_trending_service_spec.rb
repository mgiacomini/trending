require 'rails_helper'

RSpec.describe Repositories::GithubTrendingService, type: :service do
  describe '#search' do
    let(:fake_response) { GithubResponse.fake! }
    let(:repositories) { described_class.new.search 'language:elixir' }
    before do
      allow(Octokit).to receive(:search_repositories).and_return fake_response
    end

    it { expect(repositories).to be_an Enumerable }
    it { repositories.each { |r| expect(r).to be_an Repository } }
  end

end
