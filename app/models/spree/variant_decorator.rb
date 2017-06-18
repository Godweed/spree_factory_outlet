module Spree
  Variant.class_eval do
    
    alias_method :orig_price_in, :price_in

    def price_in(currency, show_discount=true)
      if show_discount
        return orig_price_in(currency) unless sale_price.present?
        sale_price_in(currency)
      else
        orig_price_in(currency)
      end
    end

    def sale_price_in(currency)
      if sale_price.present?
        Spree::Price.new(variant_id: self.id, amount: self.sale_price, currency: currency)
      end
    end

  end
end