# frozen_string_literal: true

# Creates results table
class CreateResultsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.string :body
      t.boolean :is_valid
      t.string :faker_class
      t.string :faker_method
      t.references :regular_expression, foreign_key: true
      t.timestamps
    end
  end
end
