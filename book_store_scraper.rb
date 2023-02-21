require 'open-uri'
require 'nokogiri'

html = URI.open("https://en.wikipedia.org/wiki/Douglas_Adams")
doc = Nokogiri::HTML(html)
description = doc.css("p")[1]

puts description