
module MyApp
  class Application < Rails::Application
    # ...
    config.exceptions_app = self.routes 
    # ..
  end
end
