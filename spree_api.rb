class SpreeApi
  require 'rest-client'
  require 'json'

  @host = 'localhost:3000'

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
        "#{@host}/api/products/#{ product_id }/?token=#{ ENV['SPREE_API_KEY'] }", 
        params
      )
    )
  end

end

product_params = {
  :product => {
    :name => 'Catphones',
    :shipping_category_id => 1,
    :price => 100
  }
}

p SpreeApi.create_product(product_params)


