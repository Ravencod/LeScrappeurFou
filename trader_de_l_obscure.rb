require 'rubygems'
require 'nokogiri'
require 'open-uri'

def trader_de_l_obscure
page1 = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
x = 0
array = []
    while x < page1.xpath("//a[@class='price' and @data-usd]").length
        a = page1.css('td.no-wrap.currency-name > a')[x].text
        b = page1.css('a.price')[x].text
        array.push({a => b})
        x+=1
    end
    puts array
end

def get_price_everyhour
    loop do
      puts ">>> starting crypto currency price retrieving now on #{Time.now}:"
      trader_de_l_obscure
      puts ">>> Done at : #{Time.now} <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      puts "..sleeping for an hour now.."
      sleep(3600)
    end
end

get_price_everyhour
