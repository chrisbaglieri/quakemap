require './application'
Quakemap::Application.initialize!

if Quakemap::Application.env == 'development'
  use AsyncRack::CommonLogger
  use Rack::Reloader, 0
end

file_server = Rack::File.new(File.join(File.dirname(__FILE__), 'public'))
run Rack::Cascade.new([file_server, Quakemap::Application.routes])