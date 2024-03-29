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

  def create_new_order
    JSON.parse(
      RestClient.post(
        "#{@host}/api/orders?token=#{ ENV['SPREE_API_KEY'] }",
        {}
      )
    )
  end

  def add_line_item(order_number, params)
    JSON.parse(
      RestClient.post( 
        "#{@host}/api/orders/#{ order_number }/line_items?token=#{ ENV['SPREE_API_KEY'] }", 
        params
      )
    )
  end

  def show_order(order_id)
    JSON.parse(
      RestClient.get(
        "#{@host}/api/orders/#{ order_id }?token=#{ ENV['SPREE_API_KEY'] }"
      )
    )
  end

  def transition_order(order_number)
    JSON.parse(
      RestClient.put(
        "#{@host}/api/checkouts/#{ order_number }/next?token=#{ ENV['SPREE_API_KEY'] }",
        {}
      )
    )
  end

  def update_order(order_id, params)
    JSON.parse(
      RestClient.put(
        "#{@host}/api/orders/#{ order_id }?token=#{ ENV['SPREE_API_KEY'] }",
        params
      )
    )
  end
end






