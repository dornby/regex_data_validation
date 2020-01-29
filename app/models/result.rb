# frozen_string_literal: true

# Behavior of Result
class Result < ActiveRecord::Base
  belongs_to :test_string
  belongs_to :regular_expression

  def valid?(regex)
    body.match?(/#{regex}/)
  end
end
