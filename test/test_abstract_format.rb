require 'test/test_helper'

App = Rack::Builder.new {
  use Rack::Lint
  use Rack::AbstractFormat
  run lambda {|env| [200, {'Content-Type' => 'text/html'}, ['']] }
}.to_app

class AbstractFormatTest < Test::Unit::TestCase

  def get(path)
    env = Rack::MockRequest.env_for(path)
    App.call(env).last
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

  test "stores format in environment" do
    env = get('/path.to/resource.xml')
    assert_equal 'xml', env['request.format']
  end
end
