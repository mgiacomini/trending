require 'json'

# This class simulate Sawyer::Resource
class GithubResponse
  def self.fake!
    json = JSON.parse File.read(faker_file)
    make_hash_with_sym json
  end

  private

  def self.make_hash_with_sym(hash)
    hash.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
  end

  def self.faker_file
    Rails.root.join 'spec/fixtures/faker.json'
  end
end
