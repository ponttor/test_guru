# frozen_string_literal: true

module ApplicationHelper
  def github_url(author, repo)
    link_to('GitHub Repo', "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'noopener')
  end

  def current_year
    Time.now.year
  end
end
