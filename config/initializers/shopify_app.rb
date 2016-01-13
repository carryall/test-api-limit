ShopifyApp.configure do |config|
  # private
  # config.api_key = "20cf41bda0442582ae15cc20f65bd179"
  # config.secret = "42d6850ef899ba1b8988c975005c1b6d"

  # public
  config.api_key = "ebc9735e859e204a1b7df25c0f2756c9"
  config.secret = "b6fb6c3fa5f8667b5c82d66e92a9dc54"
  config.redirect_uri = "http://localproxy.localtunnel.me/auth/shopify/callback"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
end
