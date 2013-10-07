include Rails.application.routes.url_helpers
SERVER_URL = "0.0.0.0:3000"
default_url_options[:host] = SERVER_URL

namespace :error_pages do
  task :generate => :environment do

    statuses = %w(404 500)
    statuses.each do |status|
      puts "generating '#{curl_command(status)}'"
      `#{curl_command(status)}`
      puts "\n\n IMPORTANT !!!\n Please remove any <script> from these files\n\n"
    end
  end
end

def curl_command(status)
  "curl #{SERVER_URL}/errors/#{status}.html > public/#{status}.html"
end
