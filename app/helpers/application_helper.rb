module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Shopone"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def is_active(path)
    current_page?(path) ? "active" : ""
  end
end
