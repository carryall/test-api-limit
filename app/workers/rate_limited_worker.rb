# module RateLimitedWorker
#   def self.included(klass)
#     # Shopify allows us to do 2r/sec/shop burstable to 40/s
#     #
#     # In order to say within limits, we're going to do 5 every 2 seconds
#     # which works out to 2.5/s. If this sustains for too long, we'll probably
#     # bleed out of their rate limit bucket but then the sleeps defined in
#     # ActiveResoruce::Connection (initializers/sidekiq_rate_limiting) will kick in
#     #
#     # Usage:
#     #
#     # class MyWorker
#     #   include Sidekiq::Worker
#     #   include RateLimitedWorker
#     #
#     #   def perform(...)
#     #   end
#     # end
#     klass.sidekiq_options rate: {
#       name: -> (shop_url, page, page_size) { "#{klass}_#{shop_url}" },
#       limit: 5,
#       period: 2
#     }
#   end
# end