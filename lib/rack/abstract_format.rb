require 'pathname'

module Rack
  class AbstractFormat

    def initialize(app)
      @app = app
    end

    def call(env)
      path = Pathname(env['PATH_INFO'])
      env['PATH_INFO'] = path.to_s.sub(/#{path.extname}$/,'')
      env['Accept'] = concat(env['Accept'], Rack::Mime.mime_type(path.extname))
      @app.call(env)
    end

    private
      def concat(accept, type)
        (accept || '').split(',').unshift(type).join(',')
      end
  end
end
