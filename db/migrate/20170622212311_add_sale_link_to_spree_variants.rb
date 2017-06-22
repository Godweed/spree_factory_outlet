class AddSaleLinkToSpreeVariants < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_variants, :sale_link, :string
  end
end
