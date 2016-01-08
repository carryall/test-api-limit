class Test

  API_KEY = "20cf41bda0442582ae15cc20f65bd179"
  PASSWORD = "dce7ea29b2051757dbe1b2653bf73a68"
  SHOP_NAME = "testdeployment"

  def private_app
    # shop_url = "https://#{API_KEY}:#{PASSWORD}@#{SHOP_NAME}.myshopify.com/admin"
    # ShopifyAPI::Base.site = shop_url
    # p "shop_url #{shop_url}"

    # shop = ShopifyAPI::Shop.current

    # Get a specific product
    # product = ShopifyAPI::Product.find(179761209)
    # 40.times do |t|
    #   product = ShopifyAPI::Product.all
    #   p "#{t} #{product.inspect}"
    # end

    10.times do |t1|
      Thread.new do
        10.times do |t2|
          shop_url = "https://#{API_KEY}:#{PASSWORD}@#{SHOP_NAME}.myshopify.com/admin"
          ShopifyAPI::Base.site = shop_url
          p "shop_url #{shop_url}"

          shop = ShopifyAPI::Shop.current
          
          product = ShopifyAPI::Product.all
          p "#{t1} #{t2} left:#{ShopifyAPI.credit_left} max?:#{ShopifyAPI.credit_maxed?}"
        end
      end
    end

    # Create a new product
    # new_product = ShopifyAPI::Product.new
    # new_product.title = "Burton Custom Freestlye 151"
    # new_product.product_type = "Snowboard"
    # new_product.vendor = "Burton"
    # new_product.save

    # # Update a product
    # product.handle = "burton-snowboard"
    # product.save
  end

  def partner_app
    ShopifyAPI::Session.setup({:api_key => API_KEY, :secret => SHARED_SECRET})
  end
end