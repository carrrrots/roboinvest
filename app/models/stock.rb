require 'open-uri'
require 'nokogiri'

class Stock < ApplicationRecord
  before_save :get_data_from_scraping
  before_save :get_previous_close_to_array
  serialize :news, Hash

  REGEXG = /([0-9]*\.[0-9]+)/
  COUNTRY = /[a-zA-Z]+/

  def get_data_from_scraping
    url = "https://www.google.com/finance/quote/#{self.symbol}:BVMF"
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)
    self.name = html_doc.css('.zzDege').text.strip
    self.news = {} if news.length > 4
    [0, 1, 2, 3, 4, 5].each do |num|
      time1 = html_doc.xpath('//div[@class="sfyJob"]')[num]&.text
      time2 = html_doc.xpath('//div[@class="Adak"]')[num]&.text
      text1 = html_doc.css('.Yfwt5')[num]&.text&.strip
      website = html_doc.xpath('//div[@class="z4rs2b"]/a/@href')[num]&.value
      image_src = html_doc.xpath('//img[@class="Z4idke"]/@src')[num]&.value
      next if time1.blank? || time2.blank? || text1.blank? || website.blank? || image_src.blank?

      news[:"news_#{num + 1}"] = {
        time: "#{time1} · #{time2}",
        text: text1,
        website: website,
        image_src: image_src
      }
    end
    self.country = 'Brazil'
    self.price_now = html_doc.css('.YMlKec').css('.fxKbKc').text.strip.scan(REGEXG)[0].join.to_f
    self.previous_close = html_doc.css('.P6K39c')[0].text.strip.scan(REGEXG)[0].join.to_f
    self.array_stock = Array.new(16) { rand(20..70) } if array_stock.length < 16

    if DateTime.now.new_offset("-03:00").hour < 11 || DateTime.now.new_offset("-03:00").hour > 17

      self.day_range_low = 0.00
      self.day_range_high = 0.00
      self.year_range_low = html_doc.css('.P6K39c')[1].text.strip.scan(REGEXG)[0].join.to_f
      self.year_range_high = html_doc.css('.P6K39c')[1].text.strip.scan(REGEXG)[1].join.to_f
      self.market_cap = html_doc.css('.P6K39c')[2].text.strip
      self.volume = html_doc.css('.P6K39c')[3].text.strip
      self.pe_ratio = html_doc.css('.P6K39c')[4].text.strip
      self.dividend_yield = html_doc.css('.P6K39c')[5].text.strip
      self.primary_exchange = html_doc.css('.P6K39c')[6].text.strip

    else

      self.day_range_low = html_doc.css('.P6K39c')[1].text.strip.scan(REGEXG)[0].join.to_f
      self.day_range_high = html_doc.css('.P6K39c')[1].text.strip.scan(REGEXG)[1].join.to_f
      self.year_range_low = html_doc.css('.P6K39c')[2].text.strip.scan(REGEXG)[0].join.to_f
      self.year_range_high = html_doc.css('.P6K39c')[2].text.strip.scan(REGEXG)[1].join.to_f
      self.market_cap = html_doc.css('.P6K39c')[3].text.strip
      self.volume = html_doc.css('.P6K39c')[4].text.strip
      self.pe_ratio = html_doc.css('.P6K39c')[5].text.strip
      self.dividend_yield = html_doc.css('.P6K39c')[6].text.strip
      self.primary_exchange = html_doc.css('.P6K39c')[7].text.strip

    end
  end

  def get_previous_close_to_array
    array_stock.push(previous_close)
    array_stock.shift
  end
end

# self.array_stock = [65.69, 68.01, 68.30, 66.33, 65.00, 62.33, 67.59, 69.37,
                   # 70.98, 70.50, 68.64, 69.50, 69.95, 70.23, 73.49, 71.87]
# self.pe_ratio = html_doc.css('.P6K39c')[4].text.strip.scan(REGEXG)[0].join.to_f
# self.country = html_doc.css('.tBHE4e')[2]['href'].scan(COUNTRY)[-4]
# def get_data_from_api
# url = "https://www.alphavantage.co/query?function=OVERVIEW&symbol=#{self.symbol}&apikey=#{ENV['ALPHA_API_KEY']}"
#  stock_serialized = URI.open(url).read
#  stock = JSON.parse(stock_serialized)
#  self.name = stock["Name"]
#  self.description = stock["Description"]
#  self.exchange = stock["Exchange"]
#  self.country = stock["Country"]
#  self.sector = stock["Sector"]
#  self.industry = stock["Industry"]
#  self.market_capitalization = stock["MarketCapitalization"]
  #  self.bookvalue = stock["BookValue"]
  #  self.dividend_per_share = stock["DividendPerShare"]
  #  self.dividend_yield = stock["DividendYield"]
  #  self.profit_margin = stock["ProfitMargin"]
  #  self.analyst_target_price = stock["AnalystTargetPrice"]
# end
      #news << {
       # time: "#{html_doc.css('.sfyJob')[num].text.strip} · #{html_doc.css('.Adak')[num].text.strip}",
       # text: html_doc.css('.Yfwt5')[num].text.strip,
       # website: html_doc.xpath('//div[@class="z4rs2b"]/a/@href')[num].value,
       # image_src: html_doc.css('.Z4idke')[num]['src']
     # }
