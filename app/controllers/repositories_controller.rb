class RepositoriesController < ApplicationController
  before_action :set_repository, only: :show

  def search
    @repositories = Repositories::GithubTrendingService.search query, limit
  end

  def index
    @repositories = Repository.all
  end

  def show
  end

  private

  def set_repository
    @repository = Repository.find(params[:id])
  end

  def query
    "language:#{language}"
  end

  def language
    params.fetch :language, 'ruby'
  end

  def limit
    params.fetch :limit, 10
  end
end
