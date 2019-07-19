require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rubocop'

PAGE_URL = "http://annuaire-des-mairies.com/"
#Méthode qui permet de récupérer l'adresse email à partir de l'url d'une mairie et l'affiche

def get_the_email_of_a_townhal_from_its_webpage(webpage)

    page = Nokogiri::HTML(open(webpage))
    email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')

        puts email.text
end

#Affichage du mail de la mairie de Vauréal
get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")

#Méthode qui permet de récupérer l'adresse email à partir de l'url d'une mairie
 def get_the_email_of_a_townhal_from_its_webpage_return(webpage)

        page = Nokogiri::HTML(open(webpage))
        email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')

    return email.text

end

#Méthode qui permet de récupérer toutes les url de villes du Val d'Oise

def get_all_the_urls_of_val_doise_townhalls(website)

    page = Nokogiri::HTML(open(website))

 # .compact permet d'enlever les "nil" de l'array

 url = page.xpath('//p/a').map {|link| link["href"]}.compact.map{|content| content = "http://annuaire-des-mairies.com#{content[1..-1]}"}
 nom = page.xpath('//p/a').map {|link| link.text}.compact

 annuaire_nom=Array.new
 annuaire_email=Array.new

 n=0

 while n < nom.length

     annuaire_nom << "Nom: #{nom[n]}"

     annuaire_email << "Email: #{get_the_email_of_a_townhal_from_its_webpage_return(url[n])}"

     n+=1
 end

 result = annuaire_nom.zip(annuaire_email)

 puts result

end

get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")