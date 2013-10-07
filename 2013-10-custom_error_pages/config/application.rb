module MyApp
  class Application < Rails::Application
    # ...
    config.exceptions_app = self.routes  # this will tell Rack to use own app (own controllers)
                                         # to route errors
    # ..
  end
end
