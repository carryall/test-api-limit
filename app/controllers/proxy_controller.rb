class ProxyController < ApplicationController

  def index
    # shop = Shop.where(shopify_domain: params[:shop]).first

    # session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
    # ShopifyAPI::Base.activate_session(session)

    # @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
    # @products = []
    render :layout => false, :content_type => 'application/liquid'
  end

  # def render_text
  #   render text: 'Hello World' and return
  # end

  # def render_text_liquid
  #   render text: 'Hello World Liquid', :layout => false, :content_type => 'application/liquid'
  # end
end
