require 'pathname'

module Rack
  class AbstractFormat

    def initialize(app)
      @app = app
    end

    def call(env)
      path = Pathname(env['PATH_INFO'])
      env['PATH_INFO'] = path.to_s.sub(/#{path.extname}$/,'')
      env['HTTP_ACCEPT'] = concat(env['HTTP_ACCEPT'], Rack::Mime.mime_type(path.extname, nil))
      @app.call(env)
    end

    private
      # TODO remove duplicates?
      #
      #   # actual example; firefox request at /foo.xml:
      #   ["application/xml", "text/html", "application/xhtml+xml", "application/xml;q=0.9", "*/*;q=0.8"]
      #
      def concat(accept, type)
        (accept || '').split(',').unshift(type).compact.join(',')
      end
  end
end
