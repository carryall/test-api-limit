class ProxyController < ApplicationController

  # SHOP_DOMAIN = "testdeployment.myshopify.com"

  def index
    # shop = Shop.where(shopify_domain: params[:shop]).first

    # session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
    # ShopifyAPI::Base.activate_session(session)

    # @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
    # @products = []
    
    # BaseWorker.perform_async do
    #   p "#{t1} #{t2}"
    #   logger.debug "#{t1} #{t2}"
    # end



    # shop = Shop.where(shopify_domain: SHOP_DOMAIN).first

    # session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
    # ShopifyAPI::Base.activate_session(session)


    round = 1

    10.times do |t1|
      Thread.new do
        10.times do |t2|
          # p "-- #{t1} #{t2}"
          # logger.debug "-- #{t1} #{t2}"
          # BaseWorker.perform_async do
          #   p "#{t1} #{t2}"
          #   logger.debug "#{t1} #{t2}"
          # end

          BaseWorker.perform_async(round: round)

          round += 1

          # product = ShopifyAPI::Product.all
          # p "#{t1} #{t2} left:#{ShopifyAPI.credit_left} max?:#{ShopifyAPI.credit_maxed?}"
        end
      end
    end

    render :layout => false#, :content_type => 'application/liquid'
  end

  # def render_text
  #   render text: 'Hello World' and return
  # end

  # def render_text_liquid
  #   render text: 'Hello World Liquid', :layout => false, :content_type => 'application/liquid'
  # end
end
