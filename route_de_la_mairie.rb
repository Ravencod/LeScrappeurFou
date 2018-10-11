require 'rubygems'
require 'nokogiri'
require 'open-uri'
    
    

def get_the_email_of_a_townhal_from_its_webpage(a)
    val_d_oise = Hash.new
    page1 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{a}"))
    val_d_oise["name"] = page1.xpath("/html/body/div/main/section[1]/div/div/div/h1").text.to_s
    val_d_oise["email"] = page1.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text.to_s
    puts val_d_oise
end

def get_all_the_urls_of_val_doise_townhalls
    page2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    x = 0
    while x < 185
        a = page2.css('a.lientxt')[x]["href"]
        get_the_email_of_a_townhal_from_its_webpage(a.slice(2..a.size))
        x +=1
    end
end



#get_the_email_of_a_townhal_from_its_webpage
get_all_the_urls_of_val_doise_townhalls

