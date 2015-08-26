module ApplicationHelper
  def tooltip(text, direction: :e, &block)
    content_tag :div, class: "tooltipped tooltipped-#{direction}", "aria-label": text, &block
  end
end
