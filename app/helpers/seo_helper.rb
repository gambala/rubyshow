# frozen_string_literal: true

module SeoHelper
  OG_AUTHOR = ['https://www.facebook.com/gambala.pro',
               'https://vk.com/gambala'].freeze

  def description(value)
    content_for :description, value.to_s
  end

  def image(value)
    content_for :image, value.to_s
  end

  def keywords(value)
    content_for :keywords, value.to_s
  end

  def modified_time(value)
    content_for :modified_time, value.iso8601
  end

  def pagetype(value)
    content_for :pagetype, value.to_s
  end

  def published_time(value)
    content_for :published_time, value.iso8601
  end

  def title(value = nil, &block)
    content_for :title, block_given? ? capture(&block) : value.to_s
  end

  def meta_for_article
    return unless content_for?(:pagetype)
    return unless content_for(:pagetype) == 'article'
    if content_for?(:published_time)
      concat content_tag :meta, nil,
                         content: content_for(:published_time),
                         property: 'article:published_time'
    end
    if content_for?(:modified_time)
      concat content_tag :meta, nil,
                         content: content_for(:modified_time),
                         property: 'article:modified_time'
    end
    content_tag :meta, nil, content: OG_AUTHOR.join(', '), property: 'article:author'
  end

  def meta_for_description
    return unless content_for?(:description)
    concat content_tag :meta, nil, content: content_for(:description), name: 'description'
    content_tag :meta, nil, content: content_for(:description), property: 'og:description'
  end

  def meta_for_image
    return unless content_for?(:image)
    content_tag :meta, nil, content: content_for(:image), property: 'og:image'
  end

  def meta_for_keywords
    return unless content_for?(:keywords)
    content_tag :meta, nil, content: content_for(:keywords), name: 'keywords'
  end

  def meta_for_pagetype
    return unless content_for?(:pagetype)
    content_tag :meta, nil, content: content_for(:pagetype), property: 'og:type'
  end

  def meta_for_site_name
    content_tag :meta, nil, content: site_name, property: 'og:site_name'
  end

  def meta_for_title
    return unless content_for?(:title)
    content_tag :meta, nil, content: content_for(:title), property: 'og:title'
  end

  def meta_for_url
    content_tag :meta, nil, content: request.original_url, property: 'og:url'
  end

  def meta_html_prefix
    return unless content_for?(:pagetype)
    return unless content_for(:pagetype).in? %w(article)
    ['og: http://ogp.me/ns#',
     "#{content_for(:pagetype)}: http://ogp.me/ns/#{content_for(:pagetype)}#"].join(' ')
  end

  def title_tag
    content_tag :title, page_title
  end

  def text_from_html(value)
    value = strip_tags(value)
    value = truncate(value, length: 150)
    value = value.gsub(/\n\n+/, '\n').gsub(/^\n|\n$/, ' ').squish
    value
  end

  private

  def page_title
    content_for(:title) || site_name
  end

  def site_name
    t('site.title')
  end
end
