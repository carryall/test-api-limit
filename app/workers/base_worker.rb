# class BaseWorker
#   include Sidekiq::Worker
#   # include RateLimitedWorker

#   SHOP_NAME = "testdeployment"
  
#   def perform(&block)
#     # shop = Shop.where(shopify_domain: SHOP_NAME).first

#     # session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
#     # ShopifyAPI::Base.activate_session(session)

#     # products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
    
#     # block.call
#   end
# end