require 'rubygems'
require 'nokogiri'
require 'open-uri'

def route_des_deputes
start = Time.now
page1 = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/regions"))
array = []
x = 0
while x < page1.xpath("//*[@id='deputes-list']/div/ul/li/a").size
    a = page1.xpath("//*[@id='deputes-list']/div/ul/li/a")[x].text
    z = page1.xpath("//*[@id='deputes-list']/div/ul/li/a")[x]['href']
    page2 = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{z}"))
    b = page2.xpath("/html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li/a")[0]['href'].delete_prefix('mailto:')
    array.push({a => b})
    puts a
    puts b
    x+=1
end
puts array
finish = Time.now
p diff = finish-start
end

route_des_deputes


