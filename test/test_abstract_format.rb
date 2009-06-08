require 'test/test_helper'

App = Rack::Builder.new {
  use Rack::Lint
  use Rack::AbstractFormat
  run lambda {|env| [200, {'Content-Type' => 'text/html'}, ['']] }
}.to_app

class AbstractFormatTest < Test::Unit::TestCase

  def get(path, opts={})
    env = Rack::MockRequest.env_for(path, opts)
    App.call(env)
    env
  end

  test "strips extension" do
    env = get('/path/resource.xml')
    assert_equal '/path/resource', env['PATH_INFO']
  end

  test "doesn't get confused with dots in path" do
    env = get('/path.to/resource.xml')
    assert_equal '/path.to/resource', env['PATH_INFO']
  end

  test "prepends requested media type to Accept header" do
    env = get('/path/resource.html', 'HTTP_ACCEPT' => 'application/xml')
    assert_equal 'text/html,application/xml' , env['HTTP_ACCEPT']
  end

  test "url without extension" do
    env = get('/path/resource', 'HTTP_ACCEPT' => 'text/html')
    assert_equal 'text/html' , env['HTTP_ACCEPT']
  end
end
