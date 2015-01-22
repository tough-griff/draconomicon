module ApplicationHelper
  # Returns a link wrapped in a list element.
  # If the link points to the current page, the "active" class is added.
  def nav_link_to(name, url)
    html_opts = { class: "active" } if current_page?(url)
    content_tag :li do
      link_to(name, url, html_opts)
    end
  end
end
