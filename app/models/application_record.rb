# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :order_randomly, -> { order('RANDOM()') }
  scope :random, -> { order_randomly.first }

  # User.all.reject_duplicates(:email)
  # Order.all.reject_duplicates(:user_id, :email, field: :slug, selected_record: :first)
  def self.reject_duplicates(*args, field: :id, selected_record: :last)
    query = 'MIN' if selected_record == :first
    query = 'MAX' if selected_record == :last
    ids = self.select("#{query}(#{field}) as #{field}").group(*args).collect(&:id) # MAX(id) as id
    where(id: ids)
  end

  # User.all.select_duplicates(:email)
  # Order.all.select_duplicates(:user_id, :email, field: :slug, selected_record: :last)
  def self.select_duplicates(*args, field: :id, rejected_record: :last)
    query = 'MIN' if rejected_record == :first
    query = 'MAX' if rejected_record == :last
    ids = self.select("#{query}(#{field}) as #{field}").group(*args).collect(&:id) # MAX(id) as id
    where.not(id: ids)
  end

  def self.ruby_select
    where(id: select { |record| yield record }.map(&:id))
  end
end
