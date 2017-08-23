class RepositoriesController < ApplicationController
  before_action :set_repository, only: :show
  before_action :set_languages

  def search
    @repositories = Repositories::GithubTrendingService.search query, limit
  end

  def index
    @repositories = Repository.all
  end

  def show
  end

  private

  def set_languages
    @languages = %w[elixir javascript ruby go python]
  end

  def set_repository
    @repository = Repository.find(params[:id])
  end

  def query
    "language:#{language}"
  end

  def language
    @current_language = params.fetch :language, @languages.first
  end

  def limit
    params.fetch :limit, 10
  end
end
