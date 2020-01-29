# frozen_string_literal: true

# Adjust results table
class AdjustResultsTable < ActiveRecord::Migration[5.2]
  def change
    add_reference :results, :test_string, foreign_key: true
    remove_column :results, :faker_method, :string
    remove_column :results, :faker_class, :string
  end
end
