module ApplicationHelper
  def nav_link_to(body = nil, url = nil, html_options = nil)
    content_tag :li, link_to(body, url, html_options), class: nav_link_class(url)
  end

  private

  def nav_link_class(url)
    return "nav-link active" if current_page?(url)
    "nav-link"
  end
end
