class SpreeApi
  require 'rest-client'
  require 'json'

  @host = 'localhost:3000'
  # @host = 'spree-sandbox-gramercy.herokuapp.com'

  def SpreeApi.list_products
    JSON.parse(
      RestClient.get "#{@host}/api/products?token=#{ ENV['SPREE_API_KEY'] }"
    )
  end

  def SpreeApi.create_product(params)
    JSON.parse(
      RestClient.post( 
        "#{@host}/api/products?token=#{ ENV['SPREE_API_KEY'] }", 
        params
      )
    )
  end

  def SpreeApi.create_product_image(product_id, params)
    JSON.parse(
      RestClient.post( 
        "#{@host}/api/products/#{ product_id }/images?token=#{ ENV['SPREE_API_KEY'] }", 
        params
      )
    )
  end

  def SpreeApi.create_product_digital(product_id, params)
    JSON.parse(
      RestClient.post( 
        "#{@host}/api/products/#{ product_id }/digitals?token=#{ ENV['SPREE_API_KEY'] }", 
        params
      )
    )
  end

end

product_params = {
  :product => {
    :name => 'Cat Picture',
    :shipping_category_id => 1,
    :price => 100
  }
}

product = SpreeApi.create_product(product_params)

p product

attachment = File.new("./cat.jpg", 'rb')

picture_params = {
  :image => {
    attachment: attachment
  }
}

product_image = SpreeApi.create_product_image(product["id"], picture_params)

p product_image

attachment = File.new("./cat.pdf", 'rb')

digital_params = {
  :digital_version => {
    :attachment => attachment
  }
}

product_digital = SpreeApi.create_product_digital(product["id"], digital_params)

p product_digital

#In api controller for digitals will have to call something similar to:
#Spree::Digital.new(attachment: attachment).save

