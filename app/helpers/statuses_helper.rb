module StatusesHelper
  def auto_link(text)
    raw Rinku.auto_link(h(text))
  end
end
