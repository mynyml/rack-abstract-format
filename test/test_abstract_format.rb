require 'test/test_helper'

@app = Rack::Builder.new {
  use Rack::Lint
  use Rack::AbstractFormat
  run lambda {|env| [200, {'Content-Type' => 'text/html'}, ['']] }
}.to_app

def get(path, opts={})
  env = Rack::MockRequest.env_for(path, opts)
  @app.call(env)
  env
end

# test: strips extension
env = get('/path/resource.xml')
assert { '/path/resource' == env['PATH_INFO'] }

# test: doesn't get confused with dots in path
env = get('/path.to/resource.xml')
assert { '/path.to/resource' == env['PATH_INFO'] }

# test: prepends requested media type to Accept header
env = get('/path/resource.html', 'HTTP_ACCEPT' => 'application/xml')
assert { 'text/html,application/xml' == env['HTTP_ACCEPT'] }

# test: url without extension
env = get('/path/resource', 'HTTP_ACCEPT' => 'text/html')
assert { 'text/html' == env['HTTP_ACCEPT'] }

# test: default format
@app = Rack::Builder.new {
  use Rack::Lint
  use Rack::AbstractFormat, 'text/html'
  run lambda {|env| [200, {'Content-Type' => 'text/html'}, ['']] }
}.to_app

env = get('/path/resource', 'HTTP_ACCEPT' => 'application/xml')
assert { 'text/html,application/xml' == env['HTTP_ACCEPT'] }

