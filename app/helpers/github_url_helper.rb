module GithubUrlHelper
  def github_url(author)
    appname = Rails.application.class.module_parent.name
    link_to appname, "https://github.com/#{author}/#{appname.downcase}/"
  end
end