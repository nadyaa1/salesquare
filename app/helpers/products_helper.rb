module ProductsHelper
  def category_filter_css_class(filter)
    return "active" if filter == @category
  end
end
