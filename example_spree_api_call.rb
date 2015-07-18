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

puts "\n\n\n\n\n"
p product

attachment = File.new("./cat.jpg", 'rb')

picture_params = {
  :image => {
    :attachment => attachment
  }
}

product_image = spree_api.create_product_image(product["id"], picture_params)

puts "\n\n\n\n\n"
p product_image

attachment = File.new("./cat.pdf", 'rb')

digital_params = {
  :digital => {
    :attachment => attachment
  }
}

product_digital = spree_api.create_product_digital(product["id"], digital_params)

puts "\n\n\n\n\n"
p product_digital

order = spree_api.create_new_order

puts "\n\n\n\n\n"
p order

item_params = {
  :line_item => {
    :variant_id => product["id"],
    :quantity => 5
  }
}

new_item = spree_api.add_line_item(order["number"], item_params)

puts "\n\n\n\n\n"
p new_item

order = spree_api.show_order(order["id"])

puts "\n\n\n\n\n"
p order

order_transition = spree_api.transition_order(order["number"])

puts "\n\n\n\n\n"
p order_transition


# redirect user to http://localhost:3000/checkout/{{ order_number }}
# I'm logged in, can i do as guest?

# should be able to go to order url, but missing info
# http://localhost:3000/orders/{{ order_number }}




