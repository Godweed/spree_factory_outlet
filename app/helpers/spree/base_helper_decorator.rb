module Spree
  BaseHelper.module_eval do

    alias_method :orig_display_price, :display_price

    def display_price(product_or_variant, show_discount=true)
      if(show_discount)
        orig_display_price(product_or_variant)
      else
        product_or_variant.
          price_in(current_currency, false).
          display_price_including_vat_for(current_price_options).
          to_html
      end
    end

    def display_sale_percentage(product_or_variant)
      if product_or_variant.sale_price.present?
        sale_price_percentage = (1-(product_or_variant.sale_price/product_or_variant.price_in(current_currency,false).amount))
        number_to_percentage(sale_price_percentage*100, precision: 0) 
      end
    end

  end
end