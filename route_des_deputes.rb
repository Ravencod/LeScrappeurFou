require 'rubygems'
require 'nokogiri'
require 'open-uri'

def route_des_deputes
page1 = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/regions"))
deputes = []
x = 0
while x < page1.xpath("//*[@id='deputes-list']/div/ul/li/a").size
    a = page1.xpath("//*[@id='deputes-list']/div/ul/li/a")[x].text.encode!
    z = page1.xpath("//*[@id='deputes-list']/div/ul/li/a")[x]['href']
    page2 = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{z}"))
    (page2.xpath("/html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li/a").empty?) ? "no mail" : b = page2.xpath("/html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li/a")[0]['href'].delete_prefix('mailto:')
    deputes.push({:first_name => a.split(' ')[1] , :last_name => a.split(' ')[2], :email => b})
    
    x+=1
end
    puts deputes
end
t_start = Time.now
route_des_deputes
t_end = Time.now
puts "\nThis took #{Time.at(t_end - t_start).utc.strftime("%H:%M:%S")} to end"
