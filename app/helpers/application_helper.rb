module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = t(:draconomicon)
    return base_title if page_title.empty?
    "#{base_title} | #{page_title}"
  end
end
