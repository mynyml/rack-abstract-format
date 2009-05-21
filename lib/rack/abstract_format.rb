require 'pathname'

module Rack
  class AbstractFormat

    def initialize(app)
      @app = app
    end

    def call(env)
      path = Pathname(env['PATH_INFO'])
      env['PATH_INFO'] = path.to_s.sub(/#{path.extname}$/,'')
      env['request.format'] = path.extname.sub(/^\./,'')
      @app.call(env)
    end
  end
end
