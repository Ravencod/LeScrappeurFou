require 'rubygems'
require 'nokogiri'
require 'open-uri'

def trader_de_l_obscure
page1 = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
x = 0
array = []
    while x < 2062
        a = page1.css('td.no-wrap.currency-name > a')[x].text
        b = page1.css('a.price')[x].text
        array.push({a => b})
        x+=1
    end
    puts array
end

start = Time.now
trader_de_l_obscure
finish = Time.now
diff = finish - start
puts diff
