class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  include Columns
  field :name
  field :buy_value, type: Integer
  field :buy_date
  field :quantity, type: Integer, default: 10
  belongs_to :user
  validates_presence_of :name
  def unit_value
    buy_value / quantity
  rescue
    0
  end
  
  def current_value
    quantity * GoldPrice.get_logam_mulia_price[0].to_i
  end
  
  def self.quantity_list
    {"1 gr" => 1, "2 gr" => 2, "3 gr" => 3, "5 gr" => 5, "10 gr" => 10, "25 gr" => 25, "50 gr" => 50, "100 gr" => 100}
  end
end