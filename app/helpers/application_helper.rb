module ApplicationHelper
  def to_price(value)
    number_to_currency value, unit: "Rp", delimiter: ".", separator: ","
  end
  
  def total_assets
    current_user.total_assets_unit * current_logam_mulia_prices[0].to_i
  end
end
