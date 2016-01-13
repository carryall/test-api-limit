class BaseWorker
  include Sidekiq::Worker
  include RateLimitedWorker

  # SHOP_DOMAIN = "testdeployment.myshopify.com"

  # sidekiq_options :queue => 'default',
  #                 :rate  => {
  #                   :name   => 'testdeployment',
  #                   :limit  => 50,
  #                   :period => 3600, ## An hour
  #                 }

  # attr_accessor :round

  sidekiq_options :retry => 5

  # The current retry count is yielded. The return value of the block must be 
  # an integer. It is used as the delay, in seconds. 
  sidekiq_retry_in do |count|
    10 * (count + 1) # (i.e. 10, 20, 30, 40)
  end

  
  def perform(round, &block)
    
    # p "limits:#{ShopifyAPI.credit_left}"

    shop = Shop.where(shopify_domain: "testdeployment.myshopify.com").first

    session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
    ShopifyAPI::Base.activate_session(session)

    begin
      max = ShopifyAPI.try(:credit_maxed?)
    rescue Exception => e
      max = false
    end

    unless max
      
      products = ShopifyAPI::Product.find(:all)

      # p "#{DateTime.now.to_s}"

      p "++++ #{self.jid}  ROUND #{round}"

      true
    else
      raise "NO CREDIT LEFT #{ShopifyAPI.credit_left}"
    end
    
  end
end