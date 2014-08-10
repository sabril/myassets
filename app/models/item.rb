class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  include Columns
  field :name
  field :buy_value
  field :buy_date
  
end