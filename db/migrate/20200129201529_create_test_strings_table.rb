# frozen_string_literal: true

# Create test_strings table
class CreateTestStringsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :test_strings do |t|
      t.string :content
      t.string :faker_class
      t.string :faker_method
      t.timestamps
    end
  end
end
