class SpreeApi
  require 'rest-client'
  require 'json'

  @host = 'localhost:3000'

  def SpreeApi.list_products
    JSON.parse(
      RestClient.get "#{@host}/api/products?token=#{ ENV['SPREE_API_KEY'] }"
    )
  end

  def SpreeApi.create_product
    JSON.parse(
      RestClient.post( 
        "#{@host}/api/products?token=#{ ENV['SPREE_API_KEY'] }",
        :product => { :name => 'Second Cat Picture' }
      )
    )
  end

end

p SpreeApi.create_product



# do i have to send the api key every time? 