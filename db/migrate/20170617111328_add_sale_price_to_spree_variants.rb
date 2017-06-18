class AddSalePriceToSpreeVariants < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_variants, :sale_price, :decimal, precision: 10, scale: 2
  end
end
