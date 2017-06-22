Deface::Override.new(virtual_path: 'spree/products/_cart_form',
  name: 'add_sale_price_to_cart',
  replace: "[data-hook='product_price']",
  text: '
      <div data-hook="product_price" class="col-md-5">
        <div id="product-price">
          <h6 class="product-section-title"><%= Spree.t(:price) %></h6>
          <div>
            <span class="lead price selling" itemprop="price">
              <%= display_price(@product) %>
            </span>
            <% if @product.sale_price.present? %>
              <span class="text-muted price selling" itemprop="price">
                <%= Spree.t(:original_price) %>:&nbsp;<s><%= display_price(@product,false) %></s>
                <%= display_sale_link(@product) %>
              </span>
              <br />
            <% end %>
            <span itemprop="priceCurrency" content="<%= @product.currency %>"></span>
          </div>

          <% if @product.master.can_supply? %>
            <link itemprop="availability" href="https://schema.org/InStock" />
          <% elsif @product.variants.empty? %>
            <br />
            <span class="out-of-stock"><%= Spree.t(:out_of_stock) %></span>
          <% end %>
        </div>

        <% if @product.can_supply? %>
          <div class="add-to-cart">
            <br />
            <div class="input-group">
              <%= number_field_tag :quantity, 1, class: "title form-control", min: 1 %>
              <span class="input-group-btn">
                <%= button_tag class: "btn btn-success", id: "add-to-cart-button", type: :submit do %>
                  <%= Spree.t(:add_to_cart) %>
                <% end %>
              </span>
            </div>
          </div>
        <% end %>
      </div>
  ')







