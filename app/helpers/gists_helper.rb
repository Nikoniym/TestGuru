module GistsHelper
  def gist_hash(url)
    url.delete('https://gist.github.com/')
  end
end
