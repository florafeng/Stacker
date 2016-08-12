require 'open-uri'
require 'nokogiri'
require 'pry'

nokogiri_object = Nokogiri::HTML(open('http://stackoverflow.com/questions/19715819/divide-number-with-decimals-javascript'))

q_body = nokogiri_object.xpath("//div[@class='question']//div[@class='post-text']").to_s
puts q_body.class


# a_body = nokogiri_object.xpath("//div[@class='answer accepted-answer']//div[@class='post-text']")
# # a = a_body.to_s
# # puts a.
# b_body = a_body.to_s
class
# # binding.pry
# puts b_body