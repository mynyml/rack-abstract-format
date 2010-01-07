require 'pathname'

module Rack
  class AbstractFormat

    def initialize(app, default = nil)
      @app, @default = app, default
    end

    def call(env)
      path = Pathname(env['PATH_INFO'])
      env['PATH_INFO'] = path.to_s.sub(/#{path.extname}$/,'')
      env['HTTP_ACCEPT'] = concat(env['HTTP_ACCEPT'], Rack::Mime.mime_type(path.extname, @default))
      @app.call(env)
    end

    private
      def concat(accept, type)
        (accept || '').split(',').unshift(type).compact.join(',')
      end
  end
end
