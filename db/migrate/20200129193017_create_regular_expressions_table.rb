# frozen_string_literal: true

# Creates regular_expressions table
class CreateRegularExpressionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :regular_expressions do |t|
      t.string :body
      t.timestamps
    end
  end
end
