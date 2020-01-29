require "faker"
require 'json'
require 'rest-client'
require 'yaml'

new_user = User.create(username: "dornby", email: "dornby@testmail.com")
body = RestClient.get("https://hacker-news.firebaseio.com/v0/topstories.json", headers = {}).body
body.gsub!(/(\,)(\S)/, "\\1 \\2")
YAML.safe_load(body).first(10).each do |article_id|
  body = RestClient.get("https://hacker-news.firebaseio.com/v0/item/#{article_id}.json", headers = {}).body
  post = Post.create(
    name: JSON.parse(body)["title"],
    url: JSON.parse(body)["url"],
    votes: JSON.parse(body)["score"]
  )
  post.user = new_user
  post.save
end
