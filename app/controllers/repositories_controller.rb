class RepositoriesController < ApplicationController
  before_action :set_repository, only: [:show, :edit, :update, :destroy]

  def search
    @repositories = Repositories::GithubTrendingService.search query, 10
  end

  # GET /repositories
  def index
    @repositories = Repository.all
  end

  # GET /repositories/1
  def show
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_repository
      @repository = Repository.find(params[:id])
    end

    def query
      language = params.fetch :language, 'ruby'

      "language:#{language}"
    end
end
