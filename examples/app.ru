# run me with:
#   $rackup examples/app.ru -p 3000
#
require 'rubygems'
require 'rack'
require 'rack/abstract_format'

class App
  def call(env)
    body = <<-TXT
      env['PATH_INFO']      #=> #{env['PATH_INFO'].inspect}
      env['request.format'] #=> #{env['request.format'].inspect}
    TXT
    [200, {'Content-Type' => 'text/plain'}, [body]]
  end
end

use Rack::AbstractFormat
run App.new
