module ApplicationHelper
  # Returns a link wrapped in a list element with the classes "nav-link" and
  # "active" if the link points to the current page.
  def nav_link_to(name = nil, options = nil, html_options = nil, &block)
    content_tag :li, class: nav_link_class(url_for(options)) do
      link_to(name, options, html_options, &block)
    end
  end

  def nav_link_class(url)
    return "nav-link active" if current_page?(url)
    "nav-link"
  end
end
