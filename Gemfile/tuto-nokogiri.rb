require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("index.html"))
puts page.class # => Nokogiri::HTML::Document


# ze méthode qui récupère l'adresse email à partir de l'url d'une mairie
def get_the_email_of_a_townhal_from_its_webpage
end

# ze méthode qui gère
def get_all_the_urls_of_val_doise_townhalls
end
