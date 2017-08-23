Octokit.configure do |c|
  c.login = ENV['OCTOKIT_CLIENT_LOGIN']
  c.password = ENV['OCTOKIT_CLIENT_PASSWORD']
end
