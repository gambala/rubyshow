# frozen_string_literal: true

class DropGraduatesTable < ActiveRecord::Migration
  def change
    drop_table :graduates
  end
end
