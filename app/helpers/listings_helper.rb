module ListingsHelper
  def format_price(price)
    "$#{price/ 100.0}"
  end 
end
