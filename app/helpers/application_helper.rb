module ApplicationHelper
  # Returns a link wrapped in a list element.
  # If the link points to the current page, the "active" class is added to the wrapper.
  def nav_link_to(name = nil, options = nil, html_options = nil, &block)
    wrapper_options = { class: "active" } if current_page?(url_for(options))
    content_tag :li, wrapper_options do
      link_to(name, options, html_options, &block)
    end
  end
end
