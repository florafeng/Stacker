require 'ruby-stackoverflow'
require 'pry'



  # /2.2/search/advanced?order=desc&sort=activity&title=how to create a DB&site=stackoverflowRun
  # {
  # "items": [
  #   {
  #     "tags": [

# Use the class methods to get down to business quickly
#response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')

print "Question: "
input = gets.chomp
front = "http://api.stackexchange.com/2.2/search/advanced?order=desc&sort=activity&title="
back = "&site=stackoverflow"

parm = front + input + back
response = HTTParty.get(parm)
#response = HTTParty.get('http://api.stackexchange.com/2.2/search/advanced?order=desc&sort=activity&title="how to create a user"&site=stackoverflow')
#puts ""
#puts response.body
#puts ""
#response["items"].each do |item|
#  puts "Title: #{item["title"]}"
#end
#puts ""
#response["items"][0]["title"] This is the title.
#puts response.body, response.code, response.message, response.headers.inspect

#/2.2/questions/32987649/answers?order=desc&sort=activity&site=stackoverflow
#/2.2/answers/{ids}?order=desc&sort=activity&site=stackoverflow
#/2.2/answers/32991419?order=desc&sort=activity&site=stackoverflow


#response = HTTParty.get('http://api.stackexchange.com/2.2/answers/32991419?order=desc&sort=activity&site=stackoverflow')

binding.pry
puts response.body
puts ""
# Or wrap things up in your own class
#class StackExchange
#  include HTTParty
#  base_uri 'api.stackexchange.com'

#  def initialize(service, page)
#    @options = { query: {site: service, page: page} }
#  end

#  def questions
#    self.class.get("/2.2/questions", @options)
#    binding.pry
#  end

#  def users
#    self.class.get("/2.2/users", @options)
#  end
#end

#stack_exchange = StackExchange.new("stackoverflow", 1)
#puts stack_exchange.questions
#puts stack_exchange.users

#binding.pry
puts "Done"
