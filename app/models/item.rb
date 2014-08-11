class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  include Columns
  field :name
  field :buy_value, type: Integer
  field :buy_date
  field :quantity, type: Integer
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
end