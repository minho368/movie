require("open-uri")

class HomeController < ApplicationController
  def index
    @movie = Array.new
      1.upto(1).each do |n|
      doc = Nokogiri::HTML(open("http://www.cine21.com/movie/lists/playing"))
      doc.css("span.tit").each do |x|
        @movie << x.inner_text
      end
    end
    
    @movieinfo = Array.new
      1.upto(1).each do |n|
      doc = Nokogiri::HTML(open("http://www.cine21.com/movie/lists/playing"))
      doc.xpath('//ul/li[@class="mov_info_li"]/a').each do |i|
        @movieinfo << i["href"]
      end
    end
    
  end
  
  def result
    
  end
  
  def search
    @title = params[:input_content]
    
    
    redirect_to '/result'
  end
  
  
 
end
