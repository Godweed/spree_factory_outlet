Deface::Override.new(virtual_path: 'spree/shared/_products',
  name: 'add_sale_price_to_product',
  replace: "#products[data-hook]",
  text: '
    <div id="products" class="row" data-hook>
      <% products.each do |product| %>
        <% url = spree.product_path(product, taxon_id: @taxon.try(:id)) %>
        <div id="product_<%= product.id %>" class="col-md-3 col-sm-6 col-xs-6 product-list-item" data-hook="products_list_item" itemscope itemtype="https://schema.org/Product">
          <div class="panel panel-default">
            <% cache(@taxon.present? ? [I18n.locale, current_currency, @taxon, product] : cache_key_for_product(product)) do %>
              <div class="panel-body text-center product-body">
                <%= link_to url, itemprop: "url" do %>
                  <%= small_image(product, itemprop: "image") %><br/>
                  <%= content_tag(:span, truncate(product.name, length: 50), class: "info", itemprop: "name", title: product.name) %>
                <% end %>
                <br/>
              </div>
              <div class="panel-footer text-center">
                <% if product.sale_price.present? %>
                  <span itemprop="offers" itemscope itemtype="https://schema.org/Offer">
                    <span class="price selling small text-muted" itemprop="price">
                      <%= Spree.t(:original_price) %>:&nbsp;<s><%= display_price(product,false) %></s>
                    </span>
                  </span>
                <% end %>
                  <br />
                  <span itemprop="offers" itemscope itemtype="https://schema.org/Offer">
                    <span class="price selling lead" itemprop="price"><%= display_price(product) %></span>
                  </span>
              </div>
            <% end %>
          </div>
        </div>
      <% end %>
      <% reset_cycle("classes") %>
    </div>
  ')