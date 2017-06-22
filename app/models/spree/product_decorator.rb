module Spree
  Product.class_eval do
    delegate_belongs_to :master, :sale_price, :sale_link
  end
end