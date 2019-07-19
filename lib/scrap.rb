require 'rubygems'
require 'nokogiri'         
require 'open-uri'
require 'rubocop'

	def get_the_email_of_a_townhal_from_its_webpage(townhal_url) 

		doc = Nokogiri:: HTML(open(townhal_url)) 
		doc.xpath( '/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
       
puts node.text

	end
end 

get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")


def get_all_the_urls_of_val_doise_townhalls (url)

	doc = Nokogiri:: HTML(open(url))
	urls_array = doc.xpath('//p/a').map{|link| link ["href"]}.map{|link|"www.http://annuaire-des-mairies.com#{link[1..-1]}"}

puts urls_array

end

get_all_the_urls_of_val_doise_townhalls ("http://annuaire-des-mairies.com/val-d-oise.html")

def get_the_email_of_val_doise_townhalls(url,townhal_url)

	get_the_email_of_val_doise_townhalls (url)
	get_the_email_of_a_townhal_from_its_webpage (townhal_url)
end

get_the_email_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html",townhal_url)
