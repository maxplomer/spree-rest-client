require_relative 'spree_api'
require 'dotenv'

Dotenv.load

spree_api = SpreeApi.new('localhost:3000')

product_params = {
  :product => {
    :name => 'Cat Picture',
    :shipping_category_id => 1,
    :price => 100
  }
}

product = spree_api.create_product(product_params)

p product

attachment = File.new("./cat.jpg", 'rb')

picture_params = {
  :image => {
    :attachment => attachment
  }
}

product_image = spree_api.create_product_image(product["id"], picture_params)

p product_image

attachment = File.new("./cat.pdf", 'rb')

digital_params = {
  :digital => {
    :attachment => attachment
  }
}

product_digital = spree_api.create_product_digital(product["id"], digital_params)

p product_digital

order = spree_api.create_new_order

p order

item_params = {
  :line_item => {
    :variant_id => product["id"],
    :quantity => 5
  }
}

new_item = spree_api.add_line_item(order["number"], item_params)

p new_item

# should be able to go to order url, but missing info
# http://localhost:3000/orders/R637194959




