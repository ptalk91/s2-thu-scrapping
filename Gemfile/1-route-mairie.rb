require 'rubygems'
require 'nokogiri'
require 'open-uri'

# ze method qui va te trouver l'email de la magnifique ville de Vaureal, 95 RPZ
def get_the_email_of_a_townhal_from_its_webpage
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
  page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |adress|
  	  puts adress.text
  	end
end

get_the_email_of_a_townhal_from_its_webpage

puts "================================================================================"

#ze method qui va récupérer tous les URLs des villes du 95, en mode N'Golo Kanté
def get_all_url
    array_url=[]
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    lien = page.css('//p/a').select{|link| link['class'] == "lientxt"}
    lien.each do|link|
    array_url << link['href'] .sub(".", "http://annuaire-des-mairies.com")
    end
  return array_url
end
get_all_url

#ze method qui va récupérer tous les emails à partir des URLs récupérés juste avant
def get_all_mail
    array_mail = []
    get_all_url.each do |url|
    mail = Nokogiri::HTML(open(url))
    array_mail << mail.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    end
  return array_mail
end
get_all_mail

# ze method qui qui va te chopper les noms de toutes les villes du 95
def get_the_town_name
  array_name=[]
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  lien = page.xpath('//p/a').each do |adress|
  array_name << adress.text
  	end
    array_name
end
get_the_town_name

# ze method qui va unir les noms des villes et leurs emails, par les liens sacrés du Hash zippé
def create_hash
  name_and_mail = Hash[get_the_town_name.zip(get_all_mail)]
  name_and_mail.each do |city, mail|
    puts "#{city} ====> #{mail}"
  end
end
create_hash
