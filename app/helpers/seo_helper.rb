module SeoHelper
  def title(page_title)
    content_for :title, page_title.to_s
  end

  def description(page_description)
    content_for :description, page_description.to_s
  end

  def description_tag
    return unless content_for?(:description)
    content_tag :meta, nil, name: 'description', content: content_for(:description)
  end

  def keywords(page_keywords)
    content_for :keywords, page_keywords.to_s
  end

  def keywords_tag
    return unless content_for?(:keywords)
    content_tag :meta, nil, name: 'keywords', content: content_for(:keywords)
  end
end
