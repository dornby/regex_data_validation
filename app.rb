# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'
require 'better_errors'
require 'pry'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

require_relative 'config/application'

set :views, (proc { File.join(root, 'app/views') })
set :bind, '0.0.0.0'

get '/' do
  erb :index
end

get '/regex=:id' do
  regular_expression_id = params['id']
  @regex = RegularExpression.find(regular_expression_id)
  erb :index
end

post '/regex' do
  regex_body = params['regex']
  new_regular_expression = RegularExpression.create(body: regex_body)
  TestString.all.each do |a_test_string|
    result = Result.create(body: a_test_string.content)
    result.test_string = a_test_string
    result.regular_expression = new_regular_expression
    result.is_valid = result.valid?(new_regular_expression.body)
    result.save
  end
  redirect "/regex=#{new_regular_expression.id}"
end
