ShopifyApp.configure do |config|
  config.api_key = "20cf41bda0442582ae15cc20f65bd179"
  config.secret = "42d6850ef899ba1b8988c975005c1b6d"
  config.redirect_uri = "http://localhost:3000/auth/shopify/callback"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
end
