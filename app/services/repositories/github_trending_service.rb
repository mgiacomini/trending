module Repositories
  class GithubTrendingService < ApplicationService

    def self.search(query, limit = 10)
      new.search query, limit
    end

    def search(query, limit = 10)
      map_repositories Octokit.search_repositories query, {
        sort: 'stars',
        order: 'desc',
        limit: limit
      }
    end

    private

    def map_repositories(json)
      json[:items].map do |repository|
        build_repository(repository)
      end
    end

    def build_repository(repository = {})
      Repository.create_with(
        language: repository[:language],
        forks_count: repository[:forks_count],
        name: repository[:name],
        description: repository[:description],
        watchers_count: repository[:watchers_count],
        url: repository[:url]
      ).find_or_create_by github_id: repository[:id]
    end
  end
end
