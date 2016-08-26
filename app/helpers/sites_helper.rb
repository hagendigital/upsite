module SitesHelper
  def site_favicon_link(site)
    if site.color.present?
      color = site.color.gsub('#', '')
      "http://placeholdit.imgix.net/~text?bg=#{color}&w=32&h=32".html_safe
    else
      '/favicon.ico?v=4'
    end
  end

  def site_link(site)
    if site.is_a?(String)
      root_url(subdomain: site)
    else
      root_url(subdomain: site.subdomain)
    end
  end
end
