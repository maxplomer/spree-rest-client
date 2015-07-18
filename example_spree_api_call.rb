require_relative 'spree_api'

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