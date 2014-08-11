class GoldPrice
  include Mongoid::Document
  include Mongoid::Timestamps
  include Columns
  
  field :price
  field :price_date, type: DateTime
  field :source
  
  def self.get_logam_mulia_price
    source = "http://www.logammulia.com/gold-id.php"
    a = Mechanize.new
    page = a.get(source)
    sell_price = page.search "#body-sub-cnt > div.column-2 > p:nth-child(3)"
    buy_price = page.search "#table-goldprice > tbody > tr:nth-child(12) > td:nth-child(3)"
    time = Time.now
    [sell_price.text.split(":")[4].gsub(/[^0-9]/, ''), buy_price.text.gsub(/[^0-9]/, ''), time]
  end
end