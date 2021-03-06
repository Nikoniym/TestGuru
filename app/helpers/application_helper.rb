module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Test Guru', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message(key)
    {notice:  'alert-success', alert: 'alert-danger'}[key.to_sym]
  end
end
