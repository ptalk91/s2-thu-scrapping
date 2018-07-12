require 'rubygems'
require 'nokogiri'
require 'open-uri'

city_urls = Hash.new
# ze method qui récupère toutes les url des villes du 95, façon N'golo Kanté
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	links = page.css("a[class = lientxt]")
	links.each{|link|
		lien = link['href']
		lien[0] = ''
		puts "http://annuaire-des-mairies.com#{lien}"}



# ze method qui récupère l'adresse email à partir de l'url de la mairie
# def get_the_email_of_a_townhal_from_its_webpage
#   doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
#   	doc.xpath('//h3/a').each do |node|
#   	  puts node.text
#   	end


# def get_all_the_urls_of_val_doise_townhalls
#   page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
#     page.xpath('/html/body/pre/a[5]').each do |town|
#     	  puts town.text
#     	end
