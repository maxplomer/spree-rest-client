class SpreeApi
  require 'rest-client'
  require 'json'

  def initialize(host)
    @host = host
  end

  def list_products
    JSON.parse(
      RestClient.get "#{@host}/api/products?token=#{ ENV['SPREE_API_KEY'] }"
    )
  end

  def create_product(params)
    JSON.parse(
      RestClient.post( 
        "#{@host}/api/products?token=#{ ENV['SPREE_API_KEY'] }", 
        params
      )
    )
  end

  def create_product_image(product_id, params)
    JSON.parse(
      RestClient.post( 
        "#{@host}/api/products/#{ product_id }/images?token=#{ ENV['SPREE_API_KEY'] }", 
        params
      )
    )
  end

  def create_product_digital(product_id, params)
    JSON.parse(
      RestClient.post( 
        "#{@host}/api/products/#{ product_id }/digitals?token=#{ ENV['SPREE_API_KEY'] }", 
        params
      )
    )
  end

  def create_new_order(params)
    JSON.parse(
      RestClient.post(
        "#{@host}/api/orders?token=#{ ENV['SPREE_API_KEY'] }",
        params
      )
    )
  end

  def add_line_item(order_id, params)
    JSON.parse(
      RestClient.post( 
        "#{@host}/api/orders/#{ order_id }/line_items?token=#{ ENV['SPREE_API_KEY'] }", 
        params
      )
    )
  end
end






