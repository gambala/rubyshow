# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :order_randomly, -> { order("RANDOM()") }

  # User.all.reject_duplicates(:email)
  # Order.all.reject_duplicates(:user_id, :email, field: :slug, selected_record: :first)
  def self.reject_duplicates(*args, field: :id, selected_record: :last)
    query = case selected_record
            when :first then 'MIN'
            when :last  then 'MAX'
            end

    ids = self.select("#{query}(#{field}) as #{field}") # MAX(id) as id
              .group(*args)
              .collect(&:id)

    where(id: ids)
  end

  def self.ruby_select(&block)
    where(id: select { |record| yield record }.map(&:id))
  end
end
