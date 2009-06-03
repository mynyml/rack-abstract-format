# run me with:
#   $rackup examples/app.ru -p 3000
#
require 'pathname'
require 'rubygems'
require 'rack'

root = Pathname(__FILE__).dirname.parent.expand_path
require root + 'lib/rack/abstract_format'

class App
  def call(env)
    body = <<-TXT
      env['PATH_INFO']    #=> #{env['PATH_INFO'].inspect}
      env['HTTP_ACCEPT']  #=> #{env['HTTP_ACCEPT'].inspect}
    TXT
    [200, {'Content-Type' => 'text/plain'}, [body]]
  end
end

use Rack::AbstractFormat
run App.new
