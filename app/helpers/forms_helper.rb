# frozen_string_literal: true

module FormsHelper
  def form_field_error(field_name, form_record)
    return unless form_record.errors[field_name].any?
    content_tag :div, form_record.errors[field_name].join(', '), class: 'help-block'
  end

  def form_field_group(field_name, form_record, div_class: nil, div_id: nil, &block)
    classes = ['field-group', div_class]
    classes << 'has-error' if form_record.errors[field_name].any?
    content_tag :div, capture(&block), class: classes.join(' '), id: div_id
  end
end
